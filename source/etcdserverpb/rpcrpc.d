module etcdserverpb.rpcrpc;


// Generated by the gRPC dlang plugin.


import etcdserverpb.rpc;
import std.array;
import grpc;
import google.protobuf;
import hunt.logging;
import core.thread;


import etcdserverpb.kv;


class KVClient
{
	this(Channel channel)
	{
		_channel = channel;
	}

	Status Range( RangeRequest request , ref RangeResponse response)
	{
		mixin(CM!(KVBase.SERVICE));
	}

	void Range( RangeRequest request , void delegate(Status status , RangeResponse response) dele)
	{
		mixin(CMA!(RangeResponse , KVBase.SERVICE));
	}

	Status Put( PutRequest request , ref PutResponse response)
	{
		mixin(CM!(KVBase.SERVICE));
	}

	void Put( PutRequest request , void delegate(Status status , PutResponse response) dele)
	{
		mixin(CMA!(PutResponse , KVBase.SERVICE));
	}

	Status DeleteRange( DeleteRangeRequest request , ref DeleteRangeResponse response)
	{
		mixin(CM!(KVBase.SERVICE));
	}

	void DeleteRange( DeleteRangeRequest request , void delegate(Status status , DeleteRangeResponse response) dele)
	{
		mixin(CMA!(DeleteRangeResponse , KVBase.SERVICE));
	}


	private:
	Channel _channel;
}

class KVBase: GrpcService
{
	enum SERVICE  = "etcdserverpb.KV";
	string getModule()
	{
		return SERVICE;
	}

	Status Range(RangeRequest , ref RangeResponse){ return Status.OK; }
	Status Put(PutRequest , ref PutResponse){ return Status.OK; }
	Status DeleteRange(DeleteRangeRequest , ref DeleteRangeResponse){ return Status.OK; }

	Status process(string method , GrpcStream stream)
	{
		switch(method)
		{
			mixin(SM!(RangeRequest , RangeResponse , "Range"));
			mixin(SM!(PutRequest , PutResponse , "Put"));
			mixin(SM!(DeleteRangeRequest , DeleteRangeResponse , "DeleteRange"));
			mixin(NONE());
		}
	}
}


class WatchClient
{
	this(Channel channel)
	{
		_channel = channel;
	}

	ClientReaderWriter!(WatchResponse ,WatchRequest) Watch(){
		mixin(CM3!(WatchResponse , WatchRequest  , WatchBase.SERVICE));
	}

	private:
	Channel _channel;
}

class WatchBase: GrpcService
{
	enum SERVICE  = "etcdserverpb.Watch";
	string getModule()
	{
		return SERVICE;
	}

	Status Watch(ServerReaderWriter!(WatchRequest , WatchResponse)){ return Status.OK; }

	Status process(string method , GrpcStream stream)
	{
		switch(method)
		{
			mixin(SM3!(WatchRequest , WatchResponse , "Watch"));
			mixin(NONE());
		}
	}
}


class LeaseClient
{
	this(Channel channel)
	{
		_channel = channel;
	}

	Status LeaseGrant( LeaseGrantRequest request , ref LeaseGrantResponse response)
	{
		mixin(CM!(LeaseBase.SERVICE));
	}

	void LeaseGrant( LeaseGrantRequest request , void delegate(Status status , LeaseGrantResponse response) dele)
	{
		mixin(CMA!(LeaseGrantResponse , LeaseBase.SERVICE));
	}

	Status LeaseRevoke( LeaseRevokeRequest request , ref LeaseRevokeResponse response)
	{
		mixin(CM!(LeaseBase.SERVICE));
	}

	void LeaseRevoke( LeaseRevokeRequest request , void delegate(Status status , LeaseRevokeResponse response) dele)
	{
		mixin(CMA!(LeaseRevokeResponse , LeaseBase.SERVICE));
	}

	ClientReaderWriter!(LeaseKeepAliveResponse ,LeaseKeepAliveRequest) LeaseKeepAlive(){
		mixin(CM3!(LeaseKeepAliveResponse , LeaseKeepAliveRequest  , LeaseBase.SERVICE));
	}
	Status LeaseTimeToLive( LeaseTimeToLiveRequest request , ref LeaseTimeToLiveResponse response)
	{
		mixin(CM!(LeaseBase.SERVICE));
	}

	void LeaseTimeToLive( LeaseTimeToLiveRequest request , void delegate(Status status , LeaseTimeToLiveResponse response) dele)
	{
		mixin(CMA!(LeaseTimeToLiveResponse , LeaseBase.SERVICE));
	}

	Status LeaseLeases( LeaseLeasesRequest request , ref LeaseLeasesResponse response)
	{
		mixin(CM!(LeaseBase.SERVICE));
	}

	void LeaseLeases( LeaseLeasesRequest request , void delegate(Status status , LeaseLeasesResponse response) dele)
	{
		mixin(CMA!(LeaseLeasesResponse , LeaseBase.SERVICE));
	}


	private:
	Channel _channel;
}

class LeaseBase: GrpcService
{
	enum SERVICE  = "etcdserverpb.Lease";
	string getModule()
	{
		return SERVICE;
	}

	Status LeaseGrant(LeaseGrantRequest , ref LeaseGrantResponse){ return Status.OK; }
	Status LeaseRevoke(LeaseRevokeRequest , ref LeaseRevokeResponse){ return Status.OK; }
	Status LeaseKeepAlive(ServerReaderWriter!(LeaseKeepAliveRequest , LeaseKeepAliveResponse)){ return Status.OK; }
	Status LeaseTimeToLive(LeaseTimeToLiveRequest , ref LeaseTimeToLiveResponse){ return Status.OK; }
	Status LeaseLeases(LeaseLeasesRequest , ref LeaseLeasesResponse){ return Status.OK; }

	Status process(string method , GrpcStream stream)
	{
		switch(method)
		{
			mixin(SM!(LeaseGrantRequest , LeaseGrantResponse , "LeaseGrant"));
			mixin(SM!(LeaseRevokeRequest , LeaseRevokeResponse , "LeaseRevoke"));
			mixin(SM3!(LeaseKeepAliveRequest , LeaseKeepAliveResponse , "LeaseKeepAlive"));
			mixin(SM!(LeaseTimeToLiveRequest , LeaseTimeToLiveResponse , "LeaseTimeToLive"));
			mixin(SM!(LeaseLeasesRequest , LeaseLeasesResponse , "LeaseLeases"));
			mixin(NONE());
		}
	}
}


class ClusterClient
{
	this(Channel channel)
	{
		_channel = channel;
	}

	Status MemberAdd( MemberAddRequest request , ref MemberAddResponse response)
	{
		mixin(CM!(ClusterBase.SERVICE));
	}

	void MemberAdd( MemberAddRequest request , void delegate(Status status , MemberAddResponse response) dele)
	{
		mixin(CMA!(MemberAddResponse , ClusterBase.SERVICE));
	}

	Status MemberRemove( MemberRemoveRequest request , ref MemberRemoveResponse response)
	{
		mixin(CM!(ClusterBase.SERVICE));
	}

	void MemberRemove( MemberRemoveRequest request , void delegate(Status status , MemberRemoveResponse response) dele)
	{
		mixin(CMA!(MemberRemoveResponse , ClusterBase.SERVICE));
	}

	Status MemberUpdate( MemberUpdateRequest request , ref MemberUpdateResponse response)
	{
		mixin(CM!(ClusterBase.SERVICE));
	}

	void MemberUpdate( MemberUpdateRequest request , void delegate(Status status , MemberUpdateResponse response) dele)
	{
		mixin(CMA!(MemberUpdateResponse , ClusterBase.SERVICE));
	}

	Status MemberList( MemberListRequest request , ref MemberListResponse response)
	{
		mixin(CM!(ClusterBase.SERVICE));
	}

	void MemberList( MemberListRequest request , void delegate(Status status , MemberListResponse response) dele)
	{
		mixin(CMA!(MemberListResponse , ClusterBase.SERVICE));
	}


	private:
	Channel _channel;
}

class ClusterBase: GrpcService
{
	enum SERVICE  = "etcdserverpb.Cluster";
	string getModule()
	{
		return SERVICE;
	}

	Status MemberAdd(MemberAddRequest , ref MemberAddResponse){ return Status.OK; }
	Status MemberRemove(MemberRemoveRequest , ref MemberRemoveResponse){ return Status.OK; }
	Status MemberUpdate(MemberUpdateRequest , ref MemberUpdateResponse){ return Status.OK; }
	Status MemberList(MemberListRequest , ref MemberListResponse){ return Status.OK; }

	Status process(string method , GrpcStream stream)
	{
		switch(method)
		{
			mixin(SM!(MemberAddRequest , MemberAddResponse , "MemberAdd"));
			mixin(SM!(MemberRemoveRequest , MemberRemoveResponse , "MemberRemove"));
			mixin(SM!(MemberUpdateRequest , MemberUpdateResponse , "MemberUpdate"));
			mixin(SM!(MemberListRequest , MemberListResponse , "MemberList"));
			mixin(NONE());
		}
	}
}



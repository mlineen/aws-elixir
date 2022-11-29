# WARNING: DO NOT EDIT, AUTO-GENERATED CODE!
# See https://github.com/aws-beam/aws-codegen for more details.

defmodule AWS.Organizations do
  @moduledoc """
  Organizations is a web service that enables you to consolidate your multiple
  Amazon Web Services accounts into an *organization* and centrally manage your
  accounts and their resources.

  This guide provides descriptions of the Organizations operations. For more
  information about using this service, see the [Organizations User Guide](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html).

  ## Support and feedback for Organizations

  We welcome your feedback. Send your comments to
  [feedback-awsorganizations@amazon.com](mailto:feedback-awsorganizations@amazon.com) or post your feedback and questions in the [Organizations support
  forum](http://forums.aws.amazon.com/forum.jspa?forumID=219). For more
  information about the Amazon Web Services support forums, see [Forums Help](http://forums.aws.amazon.com/help.jspa).

  ## Endpoint to call When using the CLI or the Amazon Web Services SDK

  For the current release of Organizations, specify the `us-east-1` region for all
  Amazon Web Services API and CLI calls made from the commercial Amazon Web
  Services Regions outside of China. If calling from one of the Amazon Web
  Services Regions in China, then specify `cn-northwest-1`. You can do this in the
  CLI by using these parameters and commands:

    * Use the following parameter with each command to specify both the
  endpoint and its region:

  `--endpoint-url https://organizations.us-east-1.amazonaws.com` *(from commercial
  Amazon Web Services Regions outside of China)*

  or

  `--endpoint-url https://organizations.cn-northwest-1.amazonaws.com.cn` *(from
  Amazon Web Services Regions in China)*

    * Use the default endpoint, but configure your default region with
  this command:

  `aws configure set default.region us-east-1` *(from commercial Amazon Web
  Services Regions outside of China)*

  or

  `aws configure set default.region cn-northwest-1` *(from Amazon Web Services
  Regions in China)*

    * Use the following parameter with each command to specify the
  endpoint:

  `--region us-east-1` *(from commercial Amazon Web Services Regions outside of
  China)*

  or

  `--region cn-northwest-1` *(from Amazon Web Services Regions in China)*

  ## Recording API Requests

  Organizations supports CloudTrail, a service that records Amazon Web Services
  API calls for your Amazon Web Services account and delivers log files to an
  Amazon S3 bucket. By using information collected by CloudTrail, you can
  determine which requests the Organizations service received, who made the
  request and when, and so on. For more about Organizations and its support for
  CloudTrail, see [Logging Organizations Events with CloudTrail](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_incident-response.html#orgs_cloudtrail-integration)
  in the *Organizations User Guide*. To learn more about CloudTrail, including how
  to turn it on and find your log files, see the [CloudTrail User Guide](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html).
  """

  alias AWS.Client
  alias AWS.Request

  def metadata do
    %{
      abbreviation: "Organizations",
      api_version: "2016-11-28",
      content_type: "application/x-amz-json-1.1",
      credential_scope: "us-east-1",
      endpoint_prefix: "organizations",
      global?: true,
      protocol: "json",
      service_id: "Organizations",
      signature_version: "v4",
      signing_name: "organizations",
      target_prefix: "AWSOrganizationsV20161128"
    }
  end

  @doc """
  Sends a response to the originator of a handshake agreeing to the action
  proposed by the handshake request.

  You can only call this operation by the following principals when they also have
  the relevant IAM permissions:

    * **Invitation to join** or ## Approve all features request
  handshakes: only a principal from the member account.

  The user who calls the API for an invitation to join must have the
  `organizations:AcceptHandshake` permission. If you enabled all features in the
  organization, the user must also have the `iam:CreateServiceLinkedRole`
  permission so that Organizations can create the required service-linked role
  named `AWSServiceRoleForOrganizations`. For more information, see [Organizations and Service-Linked
  Roles](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integration_services.html#orgs_integration_service-linked-roles)
  in the *Organizations User Guide*.

    * **Enable all features final confirmation** handshake: only a
  principal from the management account.

  For more information about invitations, see [Inviting an Amazon Web Services account to join your
  organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_invites.html)
  in the *Organizations User Guide.* For more information about requests to enable
  all features in the organization, see [Enabling all features in your organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html)
  in the *Organizations User Guide.*

  After you accept a handshake, it continues to appear in the results of relevant
  APIs for only 30 days. After that, it's deleted.
  """
  def accept_handshake(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "AcceptHandshake", input, options)
  end

  @doc """
  Attaches a policy to a root, an organizational unit (OU), or an individual
  account.

  How the policy affects accounts depends on the type of policy. Refer to the
  *Organizations User Guide* for information about each policy type:

    *
  [AISERVICES_OPT_OUT_POLICY](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html)     *
  [BACKUP_POLICY](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_backup.html)

    *
  [SERVICE_CONTROL_POLICY](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scp.html)     *
  [TAG_POLICY](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_tag-policies.html)

  This operation can be called only from the organization's management account.
  """
  def attach_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "AttachPolicy", input, options)
  end

  @doc """
  Cancels a handshake.

  Canceling a handshake sets the handshake state to `CANCELED`.

  This operation can be called only from the account that originated the
  handshake. The recipient of the handshake can't cancel it, but can use
  `DeclineHandshake` instead. After a handshake is canceled, the recipient can no
  longer respond to that handshake.

  After you cancel a handshake, it continues to appear in the results of relevant
  APIs for only 30 days. After that, it's deleted.
  """
  def cancel_handshake(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CancelHandshake", input, options)
  end

  @doc """
  Closes an Amazon Web Services member account within an organization.

  You can't close the management account with this API. This is an asynchronous
  request that Amazon Web Services performs in the background. Because
  `CloseAccount` operates asynchronously, it can return a successful completion
  message even though account closure might still be in progress. You need to wait
  a few minutes before the account is fully closed. To check the status of the
  request, do one of the following:

    * Use the `AccountId` that you sent in the `CloseAccount` request to
  provide as a parameter to the `DescribeAccount` operation.

  While the close account request is in progress, Account status will indicate
  PENDING_CLOSURE. When the close account request completes, the status will
  change to SUSPENDED.

    * Check the CloudTrail log for the `CloseAccountResult` event that
  gets published after the account closes successfully. For information on using
  CloudTrail with Organizations, see [Logging and monitoring in Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_security_incident-response.html#orgs_cloudtrail-integration)
  in the *Organizations User Guide.*

     You can only close 10% of active member accounts within a rolling
  30 day period. This quota is not bound by a calendar month, but starts when you
  close an account. Within 30 days of that initial account closure, you can't
  exceed the 10% account closure limit.

     To reinstate a closed account, contact Amazon Web Services Support
  within the 90-day grace period while the account is in SUSPENDED status.

     If the Amazon Web Services account you attempt to close is linked
  to an Amazon Web Services GovCloud (US) account, the `CloseAccount` request will
  close both accounts. To learn important pre-closure details, see [ Closing an Amazon Web Services GovCloud (US)
  account](https://docs.aws.amazon.com/govcloud-us/latest/UserGuide/Closing-govcloud-account.html)
  in the * Amazon Web Services GovCloud User Guide*.

  For more information about closing accounts, see [Closing an Amazon Web Services account](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_close.html)
  in the *Organizations User Guide.*
  """
  def close_account(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CloseAccount", input, options)
  end

  @doc """
  Creates an Amazon Web Services account that is automatically a member of the
  organization whose credentials made the request.

  This is an asynchronous request that Amazon Web Services performs in the
  background. Because `CreateAccount` operates asynchronously, it can return a
  successful completion message even though account initialization might still be
  in progress. You might need to wait a few minutes before you can successfully
  access the account. To check the status of the request, do one of the following:

    * Use the `Id` value of the `CreateAccountStatus` response element
  from this operation to provide as a parameter to the
  `DescribeCreateAccountStatus` operation.

    * Check the CloudTrail log for the `CreateAccountResult` event. For
  information on using CloudTrail with Organizations, see [Logging and monitoring in
  Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_security_incident-response.html#orgs_cloudtrail-integration)
  in the *Organizations User Guide.*

  The user who calls the API to create an account must have the
  `organizations:CreateAccount` permission. If you enabled all features in the
  organization, Organizations creates the required service-linked role named
  `AWSServiceRoleForOrganizations`. For more information, see [Organizations and Service-Linked
  Roles](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html#orgs_integrate_services-using_slrs)
  in the *Organizations User Guide*.

  If the request includes tags, then the requester must have the
  `organizations:TagResource` permission.

  Organizations preconfigures the new member account with a role (named
  `OrganizationAccountAccessRole` by default) that grants users in the management
  account administrator permissions in the new member account. Principals in the
  management account can assume the role. Organizations clones the company name
  and address information for the new account from the organization's management
  account.

  This operation can be called only from the organization's management account.

  For more information about creating accounts, see [Creating an Amazon Web Services account in Your
  Organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_create.html)
  in the *Organizations User Guide.*

     When you create an account in an organization using the
  Organizations console, API, or CLI commands, the information required for the
  account to operate as a standalone account, such as a payment method and signing
  the end user license agreement (EULA) is *not* automatically collected. If you
  must remove an account from your organization later, you can do so only after
  you provide the missing information. Follow the steps at [ To leave an organization as a member
  account](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info)
  in the *Organizations User Guide*.

     If you get an exception that indicates that you exceeded your
  account limits for the organization, contact [Amazon Web Services Support](https://console.aws.amazon.com/support/home#/).

     If you get an exception that indicates that the operation failed
  because your organization is still initializing, wait one hour and then try
  again. If the error persists, contact [Amazon Web Services Support](https://console.aws.amazon.com/support/home#/).

     Using `CreateAccount` to create multiple temporary accounts isn't
  recommended. You can only close an account from the Billing and Cost Management
  console, and you must be signed in as the root user. For information on the
  requirements and process for closing an account, see [Closing an Amazon Web Services
  account](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_close.html)
  in the *Organizations User Guide*.

  When you create a member account with this operation, you can choose whether to
  create the account with the ## IAM User and Role Access to Billing Information
  switch enabled. If you enable it, IAM users and roles that have appropriate
  permissions can view billing information for the account. If you disable it,
  only the account root user can access billing information. For information about
  how to disable this switch for an account, see [Granting Access to Your Billing Information and
  Tools](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html).
  """
  def create_account(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateAccount", input, options)
  end

  @doc """
  This action is available if all of the following are true:

    * You're authorized to create accounts in the Amazon Web Services
  GovCloud (US) Region.

  For more information on the Amazon Web Services GovCloud (US) Region, see the [
  *Amazon Web Services GovCloud User
  Guide*.](https://docs.aws.amazon.com/govcloud-us/latest/UserGuide/welcome.html)

    * You already have an account in the Amazon Web Services GovCloud
  (US) Region that is paired with a management account of an organization in the
  commercial Region.

    * You call this action from the management account of your
  organization in the commercial Region.

    * You have the `organizations:CreateGovCloudAccount` permission.

  Organizations automatically creates the required service-linked role named
  `AWSServiceRoleForOrganizations`. For more information, see [Organizations and Service-Linked
  Roles](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html#orgs_integrate_services-using_slrs)
  in the *Organizations User Guide.*

  Amazon Web Services automatically enables CloudTrail for Amazon Web Services
  GovCloud (US) accounts, but you should also do the following:

    * Verify that CloudTrail is enabled to store logs.

    * Create an Amazon S3 bucket for CloudTrail log storage.

  For more information, see [Verifying CloudTrail Is Enabled](https://docs.aws.amazon.com/govcloud-us/latest/UserGuide/verifying-cloudtrail.html)
  in the *Amazon Web Services GovCloud User Guide*.

  If the request includes tags, then the requester must have the
  `organizations:TagResource` permission. The tags are attached to the commercial
  account associated with the GovCloud account, rather than the GovCloud account
  itself. To add tags to the GovCloud account, call the `TagResource` operation in
  the GovCloud Region after the new GovCloud account exists.

  You call this action from the management account of your organization in the
  commercial Region to create a standalone Amazon Web Services account in the
  Amazon Web Services GovCloud (US) Region. After the account is created, the
  management account of an organization in the Amazon Web Services GovCloud (US)
  Region can invite it to that organization. For more information on inviting
  standalone accounts in the Amazon Web Services GovCloud (US) to join an
  organization, see
  [Organizations](https://docs.aws.amazon.com/govcloud-us/latest/UserGuide/govcloud-organizations.html) in the *Amazon Web Services GovCloud User Guide.*

  Calling `CreateGovCloudAccount` is an asynchronous request that Amazon Web
  Services performs in the background. Because `CreateGovCloudAccount` operates
  asynchronously, it can return a successful completion message even though
  account initialization might still be in progress. You might need to wait a few
  minutes before you can successfully access the account. To check the status of
  the request, do one of the following:

    * Use the `OperationId` response element from this operation to
  provide as a parameter to the `DescribeCreateAccountStatus` operation.

    * Check the CloudTrail log for the `CreateAccountResult` event. For
  information on using CloudTrail with Organizations, see [Monitoring the Activity
  in Your
  Organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_monitoring.html)
  in the *Organizations User Guide.*

  When you call the `CreateGovCloudAccount` action, you create two accounts: a
  standalone account in the Amazon Web Services GovCloud (US) Region and an
  associated account in the commercial Region for billing and support purposes.
  The account in the commercial Region is automatically a member of the
  organization whose credentials made the request. Both accounts are associated
  with the same email address.

  A role is created in the new account in the commercial Region that allows the
  management account in the organization in the commercial Region to assume it. An
  Amazon Web Services GovCloud (US) account is then created and associated with
  the commercial account that you just created. A role is also created in the new
  Amazon Web Services GovCloud (US) account that can be assumed by the Amazon Web
  Services GovCloud (US) account that is associated with the management account of
  the commercial organization. For more information and to view a diagram that
  explains how account access works, see
  [Organizations](https://docs.aws.amazon.com/govcloud-us/latest/UserGuide/govcloud-organizations.html) in the *Amazon Web Services GovCloud User Guide.*

  For more information about creating accounts, see [Creating an Amazon Web
  Services account in Your
  Organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_create.html)
  in the *Organizations User Guide.*

     When you create an account in an organization using the
  Organizations console, API, or CLI commands, the information required for the
  account to operate as a standalone account is *not* automatically collected.
  This includes a payment method and signing the end user license agreement
  (EULA). If you must remove an account from your organization later, you can do
  so only after you provide the missing information. Follow the steps at [ To leave an organization as a member
  account](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info)
  in the *Organizations User Guide.*

     If you get an exception that indicates that you exceeded your
  account limits for the organization, contact [Amazon Web Services Support](https://console.aws.amazon.com/support/home#/).

     If you get an exception that indicates that the operation failed
  because your organization is still initializing, wait one hour and then try
  again. If the error persists, contact [Amazon Web Services Support](https://console.aws.amazon.com/support/home#/).

     Using `CreateGovCloudAccount` to create multiple temporary accounts
  isn't recommended. You can only close an account from the Amazon Web Services
  Billing and Cost Management console, and you must be signed in as the root user.
  For information on the requirements and process for closing an account, see
  [Closing an Amazon Web Services account](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_close.html)
  in the *Organizations User Guide*.

  When you create a member account with this operation, you can choose whether to
  create the account with the ## IAM User and Role Access to Billing Information
  switch enabled. If you enable it, IAM users and roles that have appropriate
  permissions can view billing information for the account. If you disable it,
  only the account root user can access billing information. For information about
  how to disable this switch for an account, see [Granting Access to Your Billing Information and
  Tools](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html).
  """
  def create_gov_cloud_account(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateGovCloudAccount", input, options)
  end

  @doc """
  Creates an Amazon Web Services organization.

  The account whose user is calling the `CreateOrganization` operation
  automatically becomes the [management account](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html#account)
  of the new organization.

  This operation must be called using credentials from the account that is to
  become the new organization's management account. The principal must also have
  the relevant IAM permissions.

  By default (or if you set the `FeatureSet` parameter to `ALL`), the new
  organization is created with all features enabled and service control policies
  automatically enabled in the root. If you instead choose to create the
  organization supporting only the consolidated billing features by setting the
  `FeatureSet` parameter to `CONSOLIDATED_BILLING"`, no policy types are enabled
  by default, and you can't use organization policies
  """
  def create_organization(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateOrganization", input, options)
  end

  @doc """
  Creates an organizational unit (OU) within a root or parent OU.

  An OU is a container for accounts that enables you to organize your accounts to
  apply policies according to your business requirements. The number of levels
  deep that you can nest OUs is dependent upon the policy types enabled for that
  root. For service control policies, the limit is five.

  For more information about OUs, see [Managing Organizational Units](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_ous.html)
  in the *Organizations User Guide.*

  If the request includes tags, then the requester must have the
  `organizations:TagResource` permission.

  This operation can be called only from the organization's management account.
  """
  def create_organizational_unit(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreateOrganizationalUnit", input, options)
  end

  @doc """
  Creates a policy of a specified type that you can attach to a root, an
  organizational unit (OU), or an individual Amazon Web Services account.

  For more information about policies and their use, see [Managing Organization Policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies.html).

  If the request includes tags, then the requester must have the
  `organizations:TagResource` permission.

  This operation can be called only from the organization's management account.
  """
  def create_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "CreatePolicy", input, options)
  end

  @doc """
  Declines a handshake request.

  This sets the handshake state to `DECLINED` and effectively deactivates the
  request.

  This operation can be called only from the account that received the handshake.
  The originator of the handshake can use `CancelHandshake` instead. The
  originator can't reactivate a declined request, but can reinitiate the process
  with a new handshake request.

  After you decline a handshake, it continues to appear in the results of relevant
  APIs for only 30 days. After that, it's deleted.
  """
  def decline_handshake(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeclineHandshake", input, options)
  end

  @doc """
  Deletes the organization.

  You can delete an organization only by using credentials from the management
  account. The organization must be empty of member accounts.
  """
  def delete_organization(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteOrganization", input, options)
  end

  @doc """
  Deletes an organizational unit (OU) from a root or another OU.

  You must first remove all accounts and child OUs from the OU that you want to
  delete.

  This operation can be called only from the organization's management account.
  """
  def delete_organizational_unit(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteOrganizationalUnit", input, options)
  end

  @doc """
  Deletes the specified policy from your organization.

  Before you perform this operation, you must first detach the policy from all
  organizational units (OUs), roots, and accounts.

  This operation can be called only from the organization's management account.
  """
  def delete_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeletePolicy", input, options)
  end

  @doc """
  Deletes the resource policy from your organization.

  You can only call this operation from the organization's management account.
  """
  def delete_resource_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeleteResourcePolicy", input, options)
  end

  @doc """
  Removes the specified member Amazon Web Services account as a delegated
  administrator for the specified Amazon Web Services service.

  Deregistering a delegated administrator can have unintended impacts on the
  functionality of the enabled Amazon Web Services service. See the documentation
  for the enabled service before you deregister a delegated administrator so that
  you understand any potential impacts.

  You can run this action only for Amazon Web Services services that support this
  feature. For a current list of services that support it, see the column
  *Supports Delegated Administrator* in the table at [Amazon Web Services Services that you can use with
  Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services_list.html)
  in the *Organizations User Guide.*

  This operation can be called only from the organization's management account.
  """
  def deregister_delegated_administrator(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DeregisterDelegatedAdministrator", input, options)
  end

  @doc """
  Retrieves Organizations-related information about the specified account.

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def describe_account(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeAccount", input, options)
  end

  @doc """
  Retrieves the current status of an asynchronous request to create an account.

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def describe_create_account_status(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeCreateAccountStatus", input, options)
  end

  @doc """
  Returns the contents of the effective policy for specified policy type and
  account.

  The effective policy is the aggregation of any policies of the specified type
  that the account inherits, plus any policy of that type that is directly
  attached to the account.

  This operation applies only to policy types *other* than service control
  policies (SCPs).

  For more information about policy inheritance, see [How Policy Inheritance Works](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies-inheritance.html)
  in the *Organizations User Guide*.

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def describe_effective_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeEffectivePolicy", input, options)
  end

  @doc """
  Retrieves information about a previously requested handshake.

  The handshake ID comes from the response to the original
  `InviteAccountToOrganization` operation that generated the handshake.

  You can access handshakes that are `ACCEPTED`, `DECLINED`, or `CANCELED` for
  only 30 days after they change to that state. They're then deleted and no longer
  accessible.

  This operation can be called from any account in the organization.
  """
  def describe_handshake(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeHandshake", input, options)
  end

  @doc """
  Retrieves information about the organization that the user's account belongs to.

  This operation can be called from any account in the organization.

  Even if a policy type is shown as available in the organization, you can disable
  it separately at the root level with `DisablePolicyType`. Use `ListRoots` to see
  the status of policy types for a specified root.
  """
  def describe_organization(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeOrganization", input, options)
  end

  @doc """
  Retrieves information about an organizational unit (OU).

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def describe_organizational_unit(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeOrganizationalUnit", input, options)
  end

  @doc """
  Retrieves information about a policy.

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def describe_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribePolicy", input, options)
  end

  @doc """
  Retrieves information about a resource policy.

  You can only call this operation from the organization's management account or
  by a member account that is a delegated administrator for an AWS service.
  """
  def describe_resource_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DescribeResourcePolicy", input, options)
  end

  @doc """
  Detaches a policy from a target root, organizational unit (OU), or account.

  If the policy being detached is a service control policy (SCP), the changes to
  permissions for Identity and Access Management (IAM) users and roles in affected
  accounts are immediate.

  Every root, OU, and account must have at least one SCP attached. If you want to
  replace the default `FullAWSAccess` policy with an SCP that limits the
  permissions that can be delegated, you must attach the replacement SCP before
  you can remove the default SCP. This is the authorization strategy of an "[allow list](https://docs.aws.amazon.com/organizations/latest/userguide/SCP_strategies.html#orgs_policies_allowlist)".
  If you instead attach a second SCP and leave the `FullAWSAccess` SCP still
  attached, and specify `"Effect": "Deny"` in the second SCP to override the
  `"Effect": "Allow"` in the `FullAWSAccess` policy (or any other attached SCP),
  you're using the authorization strategy of a "[deny list](https://docs.aws.amazon.com/organizations/latest/userguide/SCP_strategies.html#orgs_policies_denylist)".

  This operation can be called only from the organization's management account.
  """
  def detach_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DetachPolicy", input, options)
  end

  @doc """
  Disables the integration of an Amazon Web Services service (the service that is
  specified by `ServicePrincipal`) with Organizations.

  When you disable integration, the specified service no longer can create a
  [service-linked role](https://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html)
  in *new* accounts in your organization. This means the service can't perform
  operations on your behalf on any new accounts in your organization. The service
  can still perform operations in older accounts until the service completes its
  clean-up from Organizations.

  We ** *strongly recommend* ** that you don't use this command to disable
  integration between Organizations and the specified Amazon Web Services service.
  Instead, use the console or commands that are provided by the specified service.
  This lets the trusted service perform any required initialization when enabling
  trusted access, such as creating any required resources and any required clean
  up of resources when disabling trusted access.

  For information about how to disable trusted service access to your organization
  using the trusted service, see the **Learn more** link under the **Supports
  Trusted Access** column at [Amazon Web Services services that you can use with Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services_list.html).
  on this page.

  If you disable access by using this command, it causes the following actions to
  occur:

     The service can no longer create a service-linked role in the
  accounts in your organization. This means that the service can't perform
  operations on your behalf on any new accounts in your organization. The service
  can still perform operations in older accounts until the service completes its
  clean-up from Organizations.

     The service can no longer perform tasks in the member accounts in
  the organization, unless those operations are explicitly permitted by the IAM
  policies that are attached to your roles. This includes any data aggregation
  from the member accounts to the management account, or to a delegated
  administrator account, where relevant.

     Some services detect this and clean up any remaining data or
  resources related to the integration, while other services stop accessing the
  organization but leave any historical data and configuration in place to support
  a possible re-enabling of the integration.

  Using the other service's console or commands to disable the integration ensures
  that the other service is aware that it can clean up any resources that are
  required only for the integration. How the service cleans up its resources in
  the organization's accounts depends on that service. For more information, see
  the documentation for the other Amazon Web Services service.

  After you perform the `DisableAWSServiceAccess` operation, the specified service
  can no longer perform operations in your organization's accounts

  For more information about integrating other services with Organizations,
  including the list of services that work with Organizations, see [Integrating Organizations with Other Amazon Web Services
  Services](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html)
  in the *Organizations User Guide.*

  This operation can be called only from the organization's management account.
  """
  def disable_aws_service_access(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DisableAWSServiceAccess", input, options)
  end

  @doc """
  Disables an organizational policy type in a root.

  A policy of a certain type can be attached to entities in a root only if that
  type is enabled in the root. After you perform this operation, you no longer can
  attach policies of the specified type to that root or to any organizational unit
  (OU) or account in that root. You can undo this by using the `EnablePolicyType`
  operation.

  This is an asynchronous request that Amazon Web Services performs in the
  background. If you disable a policy type for a root, it still appears enabled
  for the organization if [all features](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html)
  are enabled for the organization. Amazon Web Services recommends that you first
  use `ListRoots` to see the status of policy types for a specified root, and then
  use this operation.

  This operation can be called only from the organization's management account.

  To view the status of available policy types in the organization, use
  `DescribeOrganization`.
  """
  def disable_policy_type(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "DisablePolicyType", input, options)
  end

  @doc """
  Enables all features in an organization.

  This enables the use of organization policies that can restrict the services and
  actions that can be called in each account. Until you enable all features, you
  have access only to consolidated billing, and you can't use any of the advanced
  account administration features that Organizations supports. For more
  information, see [Enabling All Features in Your Organization](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html)
  in the *Organizations User Guide.*

  This operation is required only for organizations that were created explicitly
  with only the consolidated billing features enabled. Calling this operation
  sends a handshake to every invited account in the organization. The feature set
  change can be finalized and the additional features enabled only after all
  administrators in the invited accounts approve the change by accepting the
  handshake.

  After you enable all features, you can separately enable or disable individual
  policy types in a root using `EnablePolicyType` and `DisablePolicyType`. To see
  the status of policy types in a root, use `ListRoots`.

  After all invited member accounts accept the handshake, you finalize the feature
  set change by accepting the handshake that contains `"Action":
  "ENABLE_ALL_FEATURES"`. This completes the change.

  After you enable all features in your organization, the management account in
  the organization can apply policies on all member accounts. These policies can
  restrict what users and even administrators in those accounts can do. The
  management account can apply policies that prevent accounts from leaving the
  organization. Ensure that your account administrators are aware of this.

  This operation can be called only from the organization's management account.
  """
  def enable_all_features(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "EnableAllFeatures", input, options)
  end

  @doc """
  Enables the integration of an Amazon Web Services service (the service that is
  specified by `ServicePrincipal`) with Organizations.

  When you enable integration, you allow the specified service to create a
  [service-linked role](https://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html)
  in all the accounts in your organization. This allows the service to perform
  operations on your behalf in your organization and its accounts.

  We recommend that you enable integration between Organizations and the specified
  Amazon Web Services service by using the console or commands that are provided
  by the specified service. Doing so ensures that the service is aware that it can
  create the resources that are required for the integration. How the service
  creates those resources in the organization's accounts depends on that service.
  For more information, see the documentation for the other Amazon Web Services
  service.

  For more information about enabling services to integrate with Organizations,
  see [Integrating Organizations with Other Amazon Web Services Services](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html)
  in the *Organizations User Guide.*

  You can only call this operation from the organization's management account and
  only if the organization has [enabled all features](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_org_support-all-features.html).
  """
  def enable_aws_service_access(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "EnableAWSServiceAccess", input, options)
  end

  @doc """
  Enables a policy type in a root.

  After you enable a policy type in a root, you can attach policies of that type
  to the root, any organizational unit (OU), or account in that root. You can undo
  this by using the `DisablePolicyType` operation.

  This is an asynchronous request that Amazon Web Services performs in the
  background. Amazon Web Services recommends that you first use `ListRoots` to see
  the status of policy types for a specified root, and then use this operation.

  This operation can be called only from the organization's management account.

  You can enable a policy type in a root only if that policy type is available in
  the organization. To view the status of available policy types in the
  organization, use `DescribeOrganization`.
  """
  def enable_policy_type(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "EnablePolicyType", input, options)
  end

  @doc """
  Sends an invitation to another account to join your organization as a member
  account.

  Organizations sends email on your behalf to the email address that is associated
  with the other account's owner. The invitation is implemented as a `Handshake`
  whose details are in the response.

     You can invite Amazon Web Services accounts only from the same
  seller as the management account. For example, if your organization's management
  account was created by Amazon Internet Services Pvt. Ltd (AISPL), an Amazon Web
  Services seller in India, you can invite only other AISPL accounts to your
  organization. You can't combine accounts from AISPL and Amazon Web Services or
  from any other Amazon Web Services seller. For more information, see
  [Consolidated Billing in India](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/useconsolidatedbilliing-India.html).

     If you receive an exception that indicates that you exceeded your
  account limits for the organization or that the operation failed because your
  organization is still initializing, wait one hour and then try again. If the
  error persists after an hour, contact [Amazon Web Services Support](https://console.aws.amazon.com/support/home#/).

  If the request includes tags, then the requester must have the
  `organizations:TagResource` permission.

  This operation can be called only from the organization's management account.
  """
  def invite_account_to_organization(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "InviteAccountToOrganization", input, options)
  end

  @doc """
  Removes a member account from its parent organization.

  This version of the operation is performed by the account that wants to leave.
  To remove a member account as a user in the management account, use
  `RemoveAccountFromOrganization` instead.

  This operation can be called only from a member account in the organization.

     The management account in an organization with all features enabled
  can set service control policies (SCPs) that can restrict what administrators of
  member accounts can do. This includes preventing them from successfully calling
  `LeaveOrganization` and leaving the organization.

     You can leave an organization as a member account only if the
  account is configured with the information required to operate as a standalone
  account. When you create an account in an organization using the Organizations
  console, API, or CLI commands, the information required of standalone accounts
  is *not* automatically collected. For each account that you want to make
  standalone, you must perform the following steps. If any of the steps are
  already completed for this account, that step doesn't appear.

       Choose a support plan

       Provide and verify the required contact information

       Provide a current payment method

  Amazon Web Services uses the payment method to charge for any billable (not free
  tier) Amazon Web Services activity that occurs while the account isn't attached
  to an organization. Follow the steps at [ To leave an organization when all required account information has not yet been
  provided](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info)
  in the *Organizations User Guide.*

     The account that you want to leave must not be a delegated
  administrator account for any Amazon Web Services service enabled for your
  organization. If the account is a delegated administrator, you must first change
  the delegated administrator account to another account that is remaining in the
  organization.

     You can leave an organization only after you enable IAM user access
  to billing in your account. For more information, see [Activating Access to the Billing and Cost Management
  Console](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/grantaccess.html#ControllingAccessWebsite-Activate)
  in the *Amazon Web Services Billing and Cost Management User Guide.*

     After the account leaves the organization, all tags that were
  attached to the account object in the organization are deleted. Amazon Web
  Services accounts outside of an organization do not support tags.

     A newly created account has a waiting period before it can be
  removed from its organization. If you get an error that indicates that a wait
  period is required, then try again in a few days.
  """
  def leave_organization(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "LeaveOrganization", input, options)
  end

  @doc """
  Lists all the accounts in the organization.

  To request only the accounts in a specified root or organizational unit (OU),
  use the `ListAccountsForParent` operation instead.

  Always check the `NextToken` response parameter for a `null` value when calling
  a `List*` operation. These operations can occasionally return an empty set of
  results even when there are more results available. The `NextToken` response
  parameter value is `null` *only* when there are no more results to display.

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def list_accounts(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListAccounts", input, options)
  end

  @doc """
  Lists the accounts in an organization that are contained by the specified target
  root or organizational unit (OU).

  If you specify the root, you get a list of all the accounts that aren't in any
  OU. If you specify an OU, you get a list of all the accounts in only that OU and
  not in any child OUs. To get a list of all accounts in the organization, use the
  `ListAccounts` operation.

  Always check the `NextToken` response parameter for a `null` value when calling
  a `List*` operation. These operations can occasionally return an empty set of
  results even when there are more results available. The `NextToken` response
  parameter value is `null` *only* when there are no more results to display.

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def list_accounts_for_parent(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListAccountsForParent", input, options)
  end

  @doc """
  Returns a list of the Amazon Web Services services that you enabled to integrate
  with your organization.

  After a service on this list creates the resources that it requires for the
  integration, it can perform operations on your organization and its accounts.

  For more information about integrating other services with Organizations,
  including the list of services that currently work with Organizations, see
  [Integrating Organizations with Other Amazon Web Services Services](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services.html)
  in the *Organizations User Guide.*

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def list_aws_service_access_for_organization(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListAWSServiceAccessForOrganization", input, options)
  end

  @doc """
  Lists all of the organizational units (OUs) or accounts that are contained in
  the specified parent OU or root.

  This operation, along with `ListParents` enables you to traverse the tree
  structure that makes up this root.

  Always check the `NextToken` response parameter for a `null` value when calling
  a `List*` operation. These operations can occasionally return an empty set of
  results even when there are more results available. The `NextToken` response
  parameter value is `null` *only* when there are no more results to display.

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def list_children(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListChildren", input, options)
  end

  @doc """
  Lists the account creation requests that match the specified status that is
  currently being tracked for the organization.

  Always check the `NextToken` response parameter for a `null` value when calling
  a `List*` operation. These operations can occasionally return an empty set of
  results even when there are more results available. The `NextToken` response
  parameter value is `null` *only* when there are no more results to display.

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def list_create_account_status(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListCreateAccountStatus", input, options)
  end

  @doc """
  Lists the Amazon Web Services accounts that are designated as delegated
  administrators in this organization.

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def list_delegated_administrators(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListDelegatedAdministrators", input, options)
  end

  @doc """
  List the Amazon Web Services services for which the specified account is a
  delegated administrator.

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def list_delegated_services_for_account(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListDelegatedServicesForAccount", input, options)
  end

  @doc """
  Lists the current handshakes that are associated with the account of the
  requesting user.

  Handshakes that are `ACCEPTED`, `DECLINED`, `CANCELED`, or `EXPIRED` appear in
  the results of this API for only 30 days after changing to that state. After
  that, they're deleted and no longer accessible.

  Always check the `NextToken` response parameter for a `null` value when calling
  a `List*` operation. These operations can occasionally return an empty set of
  results even when there are more results available. The `NextToken` response
  parameter value is `null` *only* when there are no more results to display.

  This operation can be called from any account in the organization.
  """
  def list_handshakes_for_account(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListHandshakesForAccount", input, options)
  end

  @doc """
  Lists the handshakes that are associated with the organization that the
  requesting user is part of.

  The `ListHandshakesForOrganization` operation returns a list of handshake
  structures. Each structure contains details and status about a handshake.

  Handshakes that are `ACCEPTED`, `DECLINED`, `CANCELED`, or `EXPIRED` appear in
  the results of this API for only 30 days after changing to that state. After
  that, they're deleted and no longer accessible.

  Always check the `NextToken` response parameter for a `null` value when calling
  a `List*` operation. These operations can occasionally return an empty set of
  results even when there are more results available. The `NextToken` response
  parameter value is `null` *only* when there are no more results to display.

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def list_handshakes_for_organization(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListHandshakesForOrganization", input, options)
  end

  @doc """
  Lists the organizational units (OUs) in a parent organizational unit or root.

  Always check the `NextToken` response parameter for a `null` value when calling
  a `List*` operation. These operations can occasionally return an empty set of
  results even when there are more results available. The `NextToken` response
  parameter value is `null` *only* when there are no more results to display.

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def list_organizational_units_for_parent(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListOrganizationalUnitsForParent", input, options)
  end

  @doc """
  Lists the root or organizational units (OUs) that serve as the immediate parent
  of the specified child OU or account.

  This operation, along with `ListChildren` enables you to traverse the tree
  structure that makes up this root.

  Always check the `NextToken` response parameter for a `null` value when calling
  a `List*` operation. These operations can occasionally return an empty set of
  results even when there are more results available. The `NextToken` response
  parameter value is `null` *only* when there are no more results to display.

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.

  In the current release, a child can have only a single parent.
  """
  def list_parents(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListParents", input, options)
  end

  @doc """
  Retrieves the list of all policies in an organization of a specified type.

  Always check the `NextToken` response parameter for a `null` value when calling
  a `List*` operation. These operations can occasionally return an empty set of
  results even when there are more results available. The `NextToken` response
  parameter value is `null` *only* when there are no more results to display.

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def list_policies(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListPolicies", input, options)
  end

  @doc """
  Lists the policies that are directly attached to the specified target root,
  organizational unit (OU), or account.

  You must specify the policy type that you want included in the returned list.

  Always check the `NextToken` response parameter for a `null` value when calling
  a `List*` operation. These operations can occasionally return an empty set of
  results even when there are more results available. The `NextToken` response
  parameter value is `null` *only* when there are no more results to display.

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def list_policies_for_target(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListPoliciesForTarget", input, options)
  end

  @doc """
  Lists the roots that are defined in the current organization.

  Always check the `NextToken` response parameter for a `null` value when calling
  a `List*` operation. These operations can occasionally return an empty set of
  results even when there are more results available. The `NextToken` response
  parameter value is `null` *only* when there are no more results to display.

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.

  Policy types can be enabled and disabled in roots. This is distinct from whether
  they're available in the organization. When you enable all features, you make
  policy types available for use in that organization. Individual policy types can
  then be enabled and disabled in a root. To see the availability of a policy type
  in an organization, use `DescribeOrganization`.
  """
  def list_roots(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListRoots", input, options)
  end

  @doc """
  Lists tags that are attached to the specified resource.

  You can attach tags to the following resources in Organizations.

    * Amazon Web Services account

    * Organization root

    * Organizational unit (OU)

    * Policy (any type)

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def list_tags_for_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListTagsForResource", input, options)
  end

  @doc """
  Lists all the roots, organizational units (OUs), and accounts that the specified
  policy is attached to.

  Always check the `NextToken` response parameter for a `null` value when calling
  a `List*` operation. These operations can occasionally return an empty set of
  results even when there are more results available. The `NextToken` response
  parameter value is `null` *only* when there are no more results to display.

  This operation can be called only from the organization's management account or
  by a member account that is a delegated administrator for an Amazon Web Services
  service.
  """
  def list_targets_for_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "ListTargetsForPolicy", input, options)
  end

  @doc """
  Moves an account from its current source parent root or organizational unit (OU)
  to the specified destination parent root or OU.

  This operation can be called only from the organization's management account.
  """
  def move_account(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "MoveAccount", input, options)
  end

  @doc """
  Creates or updates a resource policy.

  You can only call this operation from the organization's management account.
  """
  def put_resource_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "PutResourcePolicy", input, options)
  end

  @doc """
  Enables the specified member account to administer the Organizations features of
  the specified Amazon Web Services service.

  It grants read-only access to Organizations service data. The account still
  requires IAM permissions to access and administer the Amazon Web Services
  service.

  You can run this action only for Amazon Web Services services that support this
  feature. For a current list of services that support it, see the column
  *Supports Delegated Administrator* in the table at [Amazon Web Services Services that you can use with
  Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_integrate_services_list.html)
  in the *Organizations User Guide.*

  This operation can be called only from the organization's management account.
  """
  def register_delegated_administrator(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "RegisterDelegatedAdministrator", input, options)
  end

  @doc """
  Removes the specified account from the organization.

  The removed account becomes a standalone account that isn't a member of any
  organization. It's no longer subject to any policies and is responsible for its
  own bill payments. The organization's management account is no longer charged
  for any expenses accrued by the member account after it's removed from the
  organization.

  This operation can be called only from the organization's management account.
  Member accounts can remove themselves with `LeaveOrganization` instead.

     You can remove an account from your organization only if the
  account is configured with the information required to operate as a standalone
  account. When you create an account in an organization using the Organizations
  console, API, or CLI commands, the information required of standalone accounts
  is *not* automatically collected. For an account that you want to make
  standalone, you must choose a support plan, provide and verify the required
  contact information, and provide a current payment method. Amazon Web Services
  uses the payment method to charge for any billable (not free tier) Amazon Web
  Services activity that occurs while the account isn't attached to an
  organization. To remove an account that doesn't yet have this information, you
  must sign in as the member account and follow the steps at [ To leave an organization when all required account information has not yet been
  provided](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html#leave-without-all-info)
  in the *Organizations User Guide.*

     The account that you want to leave must not be a delegated
  administrator account for any Amazon Web Services service enabled for your
  organization. If the account is a delegated administrator, you must first change
  the delegated administrator account to another account that is remaining in the
  organization.

     After the account leaves the organization, all tags that were
  attached to the account object in the organization are deleted. Amazon Web
  Services accounts outside of an organization do not support tags.
  """
  def remove_account_from_organization(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "RemoveAccountFromOrganization", input, options)
  end

  @doc """
  Adds one or more tags to the specified resource.

  Currently, you can attach tags to the following resources in Organizations.

    * Amazon Web Services account

    * Organization root

    * Organizational unit (OU)

    * Policy (any type)

  This operation can be called only from the organization's management account.
  """
  def tag_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "TagResource", input, options)
  end

  @doc """
  Removes any tags with the specified keys from the specified resource.

  You can attach tags to the following resources in Organizations.

    * Amazon Web Services account

    * Organization root

    * Organizational unit (OU)

    * Policy (any type)

  This operation can be called only from the organization's management account.
  """
  def untag_resource(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UntagResource", input, options)
  end

  @doc """
  Renames the specified organizational unit (OU).

  The ID and ARN don't change. The child OUs and accounts remain in place, and any
  attached policies of the OU remain attached.

  This operation can be called only from the organization's management account.
  """
  def update_organizational_unit(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdateOrganizationalUnit", input, options)
  end

  @doc """
  Updates an existing policy with a new name, description, or content.

  If you don't supply any parameter, that value remains unchanged. You can't
  change a policy's type.

  This operation can be called only from the organization's management account.
  """
  def update_policy(%Client{} = client, input, options \\ []) do
    meta = metadata()

    Request.request_post(client, meta, "UpdatePolicy", input, options)
  end
end

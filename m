Return-Path: <linux-mips+bounces-15000-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0CLJGboAJ2oSpgIAu9opvQ
	(envelope-from <linux-mips+bounces-15000-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 19:49:46 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF580659649
	for <lists+linux-mips@lfdr.de>; Mon, 08 Jun 2026 19:49:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=Pkvn9Av8;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15000-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15000-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF1EF323D441
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2026 16:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1403D4132;
	Mon,  8 Jun 2026 16:48:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180593D2FF0
	for <linux-mips@vger.kernel.org>; Mon,  8 Jun 2026 16:48:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780937293; cv=none; b=EmlHACIgm0jTD0+s74+zSpTMQtDty9vHU/dYZXr7RUAHO5CiWbg154TySIUQbONC5r/ZELJNPgKHEKxFo3x7ZExCJMyiZ7bgPwyBU87zS6VxnoJyLSj4x1ZPK+dk0sObBLl5cSCw17lIxK/Q9XWjSAXpPn3ildd/EIxCRW7V7a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780937293; c=relaxed/simple;
	bh=JI5C7ugHpC0Id6mKn0j06lGdSpthSyUJLbA8pjzWS6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pVPQGhgpWCTOdZ096QiE6UGAcNTxuq28yd4/mnaMrN53rvWcOf1BkJLsHR9m1P1g+8ESxHxZkUxdIEMgpXPGFJkTts9B9yOEQzAQtHJFVbXFdi0yqRO7HIrtDbHC8iqrrKwl8b6dxo5/i5ul1hQG4dHMCMjHP8/XZTvLwCoWg8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pkvn9Av8; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780937291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HO1z1hECglS3oHNycHe52C8L+SIuRFyFX5+d24s3Qxo=;
	b=Pkvn9Av8ODbUpDp4UhKrhlhaVOKqGbF8/0TgF7oatjAFx8JCILE53Q0iZPq5V/fRCfda2C
	ILnfvfP6cGPP8bKxDj2MiNPlUzfZbTo1YFl9g6Zp2JLugHeV8qJq30YhEmDbPAIQzaWTEn
	H+0xrnL+99YRJTISntY7jz7sMqGiOy8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664-jTkQIDEiMJ6cjZxqb-ZLkw-1; Mon,
 08 Jun 2026 12:48:07 -0400
X-MC-Unique: jTkQIDEiMJ6cjZxqb-ZLkw-1
X-Mimecast-MFC-AGG-ID: jTkQIDEiMJ6cjZxqb-ZLkw_1780937285
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0DA901800605;
	Mon,  8 Jun 2026 16:48:04 +0000 (UTC)
Received: from [10.44.48.99] (unknown [10.44.48.99])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A13881800664;
	Mon,  8 Jun 2026 16:47:56 +0000 (UTC)
Message-ID: <e7eb0dba-790a-4644-9895-5c9a7420d7fe@redhat.com>
Date: Mon, 8 Jun 2026 18:47:54 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 35/60] kvm: Add VCPU plane-scheduling state and helpers
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
 Sean Christopherson <seanjc@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, ashish.kalra@amd.com,
 michael.roth@amd.com, nsaenz@amazon.com, anelkz@amazon.de,
 James.Bottomley@HansenPartnership.com, Melody Wang <huibo.wang@amd.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 x86@kernel.org, coconut-svsm@lists.linux.dev, joerg.roedel@amd.com
References: <20260608144252.351443-1-joro@8bytes.org>
 <20260608144252.351443-36-joro@8bytes.org>
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20260608144252.351443-36-joro@8bytes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15000-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:joro@8bytes.org,m:seanjc@google.com,m:thomas.lendacky@amd.com,m:ashish.kalra@amd.com,m:michael.roth@amd.com,m:nsaenz@amazon.com,m:anelkz@amazon.de,m:James.Bottomley@HansenPartnership.com,m:huibo.wang@amd.com,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kvmarm@lists.linux.dev,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm-riscv@lists.infradead.org,m:x86@kernel.org,m:coconut-svsm@lists.linux.dev,m:joerg.roedel@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[pbonzini@redhat.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pbonzini@redhat.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF580659649

On 6/8/26 16:42, Jörg Rödel wrote:
> From: Joerg Roedel <joerg.roedel@amd.com>
> 
> The algorithm is to always run the lowest runnable plane. Plane
> switches are done by stopping the current plane and setting another
> runnable.
> 
> Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>

This was left arbitrary in my version because for example Hyper-V VTLs 
use highest-runnable instead.  It also made pure userspace scheduling 
possible, though that may not be very important in the grand scheme of 
things.

Did you drop it because it didn't work, or just for simplicity?

Paolo

> ---
>   include/linux/kvm_host.h | 16 ++++++++++++++
>   virt/kvm/kvm_main.c      | 45 ++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 61 insertions(+)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 5c3f9dfa15ea..e3611e6cc3e4 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -168,6 +168,7 @@ static inline bool kvm_is_error_gpa(gpa_t gpa)
>   #define KVM_REQ_VM_DEAD			(1 | KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
>   #define KVM_REQ_UNBLOCK			2
>   #define KVM_REQ_DIRTY_RING_SOFT_FULL	3
> +#define KVM_REQ_PLANE_RESCHED		4
>   #define KVM_REQUEST_ARCH_BASE		8
>   
>   /*
> @@ -324,6 +325,8 @@ struct kvm_mmio_fragment {
>   	unsigned int len;
>   };
>   
> +
> +
>   struct kvm_vcpu_common {
>   	struct kvm *kvm;
>   
> @@ -381,6 +384,8 @@ struct kvm_vcpu_common {
>   
>   	struct kvm_dirty_ring dirty_ring;
>   
> +	bool plane_switch;
> +
>   	struct kvm_vcpu_arch_common arch;
>   };
>   
> @@ -388,6 +393,12 @@ struct kvm_vcpu_common {
>   	for ((i) = 0; (i) < KVM_MAX_PLANES; ++(i))		\
>   		if (((v) = common->vcpus[(i)]) != NULL)
>   
> +/* Tracked per plane-VCPU - used for deciding which plane-vcpu to run */
> +enum kvm_vcpu_state {
> +	STOPPED,
> +	RUNNABLE,
> +};
> +
>   struct kvm_vcpu {
>   	struct kvm *kvm;
>   	struct kvm_plane *plane;
> @@ -401,6 +412,7 @@ struct kvm_vcpu {
>   	struct kvm_run *run;
>   
>   	u64 plane_requests;
> +	enum kvm_vcpu_state plane_state;
>   
>   	/* S390 only */
>   	bool valid_wakeup;
> @@ -440,6 +452,10 @@ struct kvm_vcpu {
>   	unsigned plane_level;
>   };
>   
> +void kvm_vcpu_set_plane_runnable(struct kvm_vcpu *vcpu);
> +void kvm_vcpu_set_plane_stopped(struct kvm_vcpu *vcpu);
> +struct kvm_vcpu *kvm_vcpu_select_plane(struct kvm_vcpu *vcpu);
> +
>   static inline bool kvm_vcpu_wants_to_run(struct kvm_vcpu *vcpu)
>   {
>   	return vcpu->common->wants_to_run;
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 9d30fd85ce5f..a30123b77112 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4397,6 +4397,7 @@ static int kvm_plane_ioctl_create_vcpu(struct kvm_plane *plane, unsigned long id
>   	vcpu->vcpu_idx = vcpu->common->vcpu_idx;
>   	vcpu->plane = plane;
>   	vcpu->plane_level = plane->level;
> +	vcpu->plane_state = STOPPED;
>   	vcpu->run = vcpu->common->run;
>   
>   	kvm_vcpu_init(vcpu, kvm, id);
> @@ -4938,6 +4939,50 @@ static struct file_operations kvm_plane_fops = {
>   	KVM_COMPAT(kvm_plane_ioctl),
>   };
>   
> +void kvm_vcpu_set_plane_runnable(struct kvm_vcpu *vcpu)
> +{
> +	vcpu->plane_state = RUNNABLE;
> +	vcpu->common->plane_switch = true;
> +	kvm_make_request(KVM_REQ_PLANE_RESCHED, vcpu);
> +}
> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_set_plane_runnable);
> +
> +void kvm_vcpu_set_plane_stopped(struct kvm_vcpu *vcpu)
> +{
> +	vcpu->plane_state = STOPPED;
> +	kvm_make_request(KVM_REQ_PLANE_RESCHED, vcpu);
> +}
> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_set_plane_stopped);
> +
> +struct kvm_vcpu *kvm_vcpu_select_plane(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_vcpu_common *common = vcpu->common;
> +	struct kvm_vcpu *ret = NULL;
> +	unsigned i;
> +
> +	for (i = 0; i < KVM_MAX_PLANES; i++) {
> +		if (common->vcpus[i] == NULL)
> +			continue;
> +
> +		if (common->vcpus[i]->plane_state == RUNNABLE) {
> +			ret = common->vcpus[i];
> +			break;
> +		}
> +	}
> +
> +	if (ret == NULL) {
> +		ret = common->vcpus[0];
> +		ret->plane_state = RUNNABLE;
> +	}
> +
> +	common->current_vcpu = ret;
> +
> +	common->plane_switch = false;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_select_plane);
> +
>   static int kvm_device_mmap(struct file *filp, struct vm_area_struct *vma)
>   {
>   	struct kvm_device *dev = filp->private_data;



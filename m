Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB832AA520
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 15:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731903AbfIENyX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 09:54:23 -0400
Received: from mail-eopbgr780123.outbound.protection.outlook.com ([40.107.78.123]:55054
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731109AbfIENyX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Sep 2019 09:54:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ou6olii5QRFTmjcZmCC89O1574BFZ4KPuc9lu8jJY+1kHUv5EP/zo+7qzjoUo6tj3rQVoUh+dGeDoZzPWK1bRFnhWGFbtneRu0t43pECXSwi8092J3aJyeO9nmIf/sbXPPmOf6xyli4lnWURPNJG4KkVOw0d/WqihfyF+N0VtEpP+SY/rzuGrr5uQBsgQ3U2r0E+5bmXK6MYC37JFgs65WFRiAOQlDaZp3zzVK9FqRO75ue0uu2zvQnbRvbIIkl9Anl5OAMw2gvM9O56uyUa2w7vlqErWgE3sXCJ8Kv86awZBVHOMBHt3eZ9U4ykbwiTJOW1RFjQAFzd4FRwY5MH9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4s+7oShYEu+v7Jfd3AS7UU0/ftvu9Fm0mT4EEH2A/0=;
 b=ldlYcUaFoxjmcRimEBi8Q9LqWt6ozHDN2aHaXiFpbEmv1f5h/8Rvb71n1I3P4SIX5IhkQHsBJGM/Y8AquEhUimoGVRcJmkIAU5TiFbUfky82mieqfYLaXU0amp9Dj+IpBoA49Voq1Gh+hEAmmpRPvsveZOCpexQyaANV7Ci/6qtswhU/IotTke7pfsMiOPnJSEgJEtGv8h9ZkmbnQKEKb0wJ4NgJSPeOS684FbGbvrkJ4Gx/1mFl0uhB4tS6lytBrcHL2nqtBd+XtZmqOJDBTqjdKzHtQZBF76Z9nyhb6DWS1QLJy+pElXKq+StGkcstmeBGvTzyRqALfYo6vpsXIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=wavecomp.com;
 dkim=pass header.d=wavecomp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4s+7oShYEu+v7Jfd3AS7UU0/ftvu9Fm0mT4EEH2A/0=;
 b=KvXh0VYkDp004ChUCP43qbNa6tkr0rm3KybO/1qkbFvNpk/Cinkrkdy0VhsdQwTH0A1iBzZroPp9+w6jBEcE9Php+lgRm7RxzgP/bgwRaZZin51ZCUMy0Z5sRkl9hIkU+uyX5QOyazD/I4F9HLiYQhw52I5xQTn94m0WI0V0rIQ=
Received: from DM5PR22MB0860.namprd22.prod.outlook.com (10.171.160.147) by
 DM5PR22MB0364.namprd22.prod.outlook.com (10.173.174.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Thu, 5 Sep 2019 13:54:19 +0000
Received: from DM5PR22MB0860.namprd22.prod.outlook.com
 ([fe80::592b:85e8:62b8:dfd9]) by DM5PR22MB0860.namprd22.prod.outlook.com
 ([fe80::592b:85e8:62b8:dfd9%3]) with mapi id 15.20.2220.022; Thu, 5 Sep 2019
 13:54:19 +0000
From:   Gary Fu <qfu@wavecomp.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Archer Yan <ayan@wavecomp.com>, James Hogan <jhogan@kernel.org>
Subject: RE: [PATCH] KVM: Fix an issue in non-preemptible kernel.
Thread-Topic: [PATCH] KVM: Fix an issue in non-preemptible kernel.
Thread-Index: AQHVYW0nkTjSutOr40CVXBCxMMHvk6cbj+0AgAFPCfA=
Date:   Thu, 5 Sep 2019 13:54:19 +0000
Message-ID: <DM5PR22MB08601676A09479ECA9B43D6EC3BB0@DM5PR22MB0860.namprd22.prod.outlook.com>
References: <20190902090148.10356-1-qfu@wavecomp.com>
 <20190904135343.gbqfs4nlpnjvyfhc@pburton-laptop>
In-Reply-To: <20190904135343.gbqfs4nlpnjvyfhc@pburton-laptop>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=qfu@wavecomp.com; 
x-originating-ip: [112.10.76.155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0786dc05-89a8-4984-017f-08d732088c72
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DM5PR22MB0364;
x-ms-traffictypediagnostic: DM5PR22MB0364:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR22MB03649D2DFB17C9B216311A89C3BB0@DM5PR22MB0364.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(136003)(396003)(39850400004)(376002)(13464003)(51914003)(199004)(189003)(33656002)(99286004)(6436002)(14454004)(2906002)(6116002)(11346002)(5660300002)(3846002)(6246003)(486006)(6862004)(476003)(478600001)(9686003)(55016002)(54906003)(66946007)(66446008)(64756008)(66556008)(66476007)(446003)(66066001)(76116006)(14444005)(53936002)(53546011)(6506007)(74316002)(102836004)(25786009)(6636002)(76176011)(256004)(7696005)(86362001)(316002)(71190400001)(71200400001)(81166006)(81156014)(8676002)(4326008)(8936002)(7736002)(305945005)(52536014)(186003)(229853002)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:DM5PR22MB0364;H:DM5PR22MB0860.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zRhQF+Ue8NuIq+gaOJYuaglmH2a8tBgGacj3JdurrWCKrxBUMBQsv4K57pkzv/Ltmml9og3A7z7D6c+NVbopXR+rtsVCaPqjj/0rxNORDQqYG0Gyoz/yADU1nj9y+peLsqpO6fL7Me7Lqji09bZFBSh5BlN0AaP/QwsXfU5GImrUwDR0LqYRZyxqN8RxhaX3LESPNUTxcMGmVXnaDYZ8xrPlAgnAHTNpRTmcWAbiZVLiCabdMpgG8C+yxn07DxIoksuZn7gX3G0o1l0bpXB+w6mPD3P2bybJpiU8dkroZZM3ebrRRBsAWivsAs6y1BH4khw0rES5QJCjWKajFbRcrV+ujjVbomHusxdoZ+BIR37dYKKetoVN2b9PaooD6+Tf7dPseqbWJAcgfo7AtSMTrqkZ8P+hYQK2jXC/zvnoikM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0786dc05-89a8-4984-017f-08d732088c72
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 13:54:19.1704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q71wfNf1vlPJQf2DgVGpR6PqbMuey0g1kz9pGJwUGpEiQk4Egv1gIP9vXpSLiBvpT0bmzdIij/0G8YJWu1xFcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR22MB0364
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

Thanks for your review.
Please see my comments below.

-----Original Message-----
From: Paul Burton <pburton@wavecomp.com>=20
Sent: Wednesday, September 4, 2019 10:03 PM
To: Gary Fu <qfu@wavecomp.com>
Cc: linux-mips@vger.kernel.org; Paul Burton <pburton@wavecomp.com>; Archer =
Yan <ayan@wavecomp.com>; James Hogan <jhogan@kernel.org>
Subject: Re: [PATCH] KVM: Fix an issue in non-preemptible kernel.

Hi Gary,

On Mon, Sep 02, 2019 at 09:02:32AM +0000, Gary Fu wrote:
> Add a cond_resched() to give the scheduler a chance to run madvise=20
> task to avoid endless loop here in non-preemptible kernel.

Thanks for the patch!

> Otherwise, the kvm_mmu_notifier would have no chance to be descreased

s/descreased/decreased/
(and in the comment too)

Thank you for your comments. I'll fix these typo errors.

> to 0 by madvise task -> syscall -> zap_page_range ->=20
> mmu_notifier_invalidate_range_end ->=20
> __mmu_notifier_invalidate_range_end -> invalidate_range_end ->=20
> kvm_mmu_notifier_invalidate_range_end, as the madvise task would be=20
> scheduled when running unmap_single_vma -> unmap_page_range ->=20
> zap_p4d_range -> zap_pud_range -> zap_pmd_range -> cond_resched which=20
> is called before mmu_notifier_invalidate_range_end in zap_page_range.

I'm not entirely sure I follow - could you clarify whether the task invokin=
g the madvise syscall is related to the task using KVM?

Yes, the QEMU application invokes the madvise syscall with behavior param M=
ADV_DONTNEED.
When handling GPA faults by creating a new GPA mapping in kvm_mips_map_page=
, it will be retrying to get available page. In the low memory case, it is =
waiting for the memory resources freed by madvise syscall with MADV_DONTNEE=
D (QEMU application -> madvise with MADV_DONTNEED -> syscall -> madvise_vma=
 -> madvise_dontneed_free -> madvise_dontneed_single_vma -> zap_page_range)=
. In zap_page_range, after the TLB of given address range is cleared by unm=
ap_single_vma, it will call __mmu_notifier_invalidate_range_end which final=
ly calls kvm_mmu_notifier_invalidate_range_end to decrease mmu_notifier_cou=
nt to 0. The retrying loop in kvm_mips_map_page checks the mmu_notifier_cou=
nt and if the value is 0 which indicates that some new page is available fo=
r mapping, it will jump out the retrying loop and set up PTE for a new GPA =
mapping.
During the TLB clearing ( in unmap_single_vma in madvise syscall) mentioned=
 above, it will call cond_resched() per PMD for avoiding occupying CPU for =
a long time (in case of huge page range zapping). When this happened in the=
 non-preemptible kernel, the retrying loop in kvm_mips_map_page will be run=
ning endlessly as there is no chance to reschedule back to madvise syscall =
to run __mmu_notifier_invalidate_range_end to decrease mmu_notifier_count s=
o that the value of  mmu_notifier_count is always 1.
Adding a scheduling point before every retry in kvm_mips_map_page will give=
 the madvise syscall (invoked by QEMU) a chance to be re-scheduled back to =
zap all the given pages and clear mmu_notifier_count value to let kvm_mips_=
map_page task jump out the loop.

> Signed-off-by: Gary Fu <qfu@wavecomp.com>
> ---
>  arch/mips/kvm/mmu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c index=20
> 97e538a8c1be..e52e63d225f4 100644
> --- a/arch/mips/kvm/mmu.c
> +++ b/arch/mips/kvm/mmu.c
> @@ -746,6 +746,22 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, =
unsigned long gpa,
>  		 */
>  		spin_unlock(&kvm->mmu_lock);
>  		kvm_release_pfn_clean(pfn);
> +		/*
> +		 * Add a cond_resched() to give the scheduler a chance to run
> +		 * madvise task to avoid endless loop here in non-preemptible
> +		 * kernel.
> +		 * Otherwise, the kvm_mmu_notifier would have no chance to be
> +		 * descreased to 0 by madvise task -> syscall -> zap_page_range
> +		 * -> mmu_notifier_invalidate_range_end ->
> +		 * __mmu_notifier_invalidate_range_end -> invalidate_range_end
> +		 * -> kvm_mmu_notifier_invalidate_range_end, as the madvise task
> +		 * would be scheduled when running unmap_single_vma ->
> +		 * unmap_page_range -> zap_p4d_range -> zap_pud_range ->
> +		 * zap_pmd_range -> cond_resched which is called before
> +		 * mmu_notifier_invalidate_range_end in zap_page_range.
> +		 */
> +		if (need_resched())
> +			cond_resched();

Can we remove the need_resched() check here? cond_resched() already checks =
should_resched(0) which tests the same thread-info flag as need_resched(). =
So we should be fine to just call cond_resched() unconditionally.

Yes, you're right. Just calling cond_resched() is enough. I'll update the p=
atch.

Thanks,
    Paul

>  		goto retry;
>  	}
> =20
> --
> 2.17.1
>=20

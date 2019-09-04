Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAA25A8857
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2019 21:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730733AbfIDOCf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Sep 2019 10:02:35 -0400
Received: from mail-eopbgr790125.outbound.protection.outlook.com ([40.107.79.125]:6593
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730639AbfIDOCe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 4 Sep 2019 10:02:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlwYQiBodOtzsC8/Jjx/gSBl931MNv/7JH2oc3DoAGo13RhBCWgBcthtrhX50wMBmOZ9jyUejymme+Ztp7CQkBZjIq9GFTaB9f9TVC6/jS7Xo/8PKtey2ZfX8PYi/aRcvzkHm/VsqYZB6JwxxNympGSZacN45fgax7L7pGejt3K1xqVU6SV3GhEmyl+1hUxam4RJ9NMrNkKH2R0nIwocKsnCv7bSMWyfBC+CNTNZRIv9jNanoRhjdj57V38b5IABSdgkfP91mAtqHMK09FzspkOWofxBAviq4TvAUsUUjFg+tbN132Ru5Z3uWyOk8Ez/ZS4Q3TQNNIiJ9IX630aWPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fl5EKIpff2tWTnQX7SoqpDcC/R28wXDUncJMXGMAIQ=;
 b=fWwkt1tSFZPqJFgE1RWp2IF+sveI+Q4VsVXABcMKp5d981F1asWrSXk2VLrnkr/kWpNJ6Wc6oFA91Uj/tgb5F62/By2eVmhfFKkLc766IFrz0oy0CscSve1GLYr0qmHrmxcB0W4NR/etiAy+5tJSU3BERo57SrSPyTgU3csMIuaucc0FuqECGoWb7pgBtr/UoOhkrejrNbqbMkAk1ULHLk56n1O1rYAXV7v0r2PB1Gpb3x4ab2zMFoVuTaRzFrWAdd4Zc70xRbjlzUiWsu67QBEJsO3cq5cmJnsPDZC63+g0FO97uMg5vV7rcXeP/kZFRdkR2RYaGD6RmgVBkuZJCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7fl5EKIpff2tWTnQX7SoqpDcC/R28wXDUncJMXGMAIQ=;
 b=jo8XmqG6FjuAc96Bq6Mp8JqvR1eGLk3pNAU+AHiVz1Kj/bovIWc6jumaDHismiUShRkSqcUQVLqIe6vJGmbsJ3qwR/4eWKckBUTKpfHa87yYmWEvP5VxgOdVqbz71FER2KbSCY2HjCVqsmkXSK1nNsslqPPGyl35/dRMC5zoSwM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1485.namprd22.prod.outlook.com (10.174.170.146) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Wed, 4 Sep 2019 14:02:30 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2220.021; Wed, 4 Sep 2019
 14:02:30 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Gary Fu <qfu@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        Archer Yan <ayan@wavecomp.com>, James Hogan <jhogan@kernel.org>
Subject: Re: [PATCH] KVM: Fix an issue in non-preemptible kernel.
Thread-Topic: [PATCH] KVM: Fix an issue in non-preemptible kernel.
Thread-Index: AQHVYylkk5V28nmdRkmNneMu0zLGcA==
Date:   Wed, 4 Sep 2019 14:02:30 +0000
Message-ID: <20190904135343.gbqfs4nlpnjvyfhc@pburton-laptop>
References: <20190902090148.10356-1-qfu@wavecomp.com>
In-Reply-To: <20190902090148.10356-1-qfu@wavecomp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0289.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::13) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.196.178.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ac7b58c-29f9-400b-575b-08d731408676
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1485;
x-ms-traffictypediagnostic: MWHPR2201MB1485:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB148508F3EE024AAF738F5AA2C1B80@MWHPR2201MB1485.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(136003)(366004)(396003)(376002)(39840400004)(346002)(199004)(189003)(51914003)(476003)(386003)(6506007)(53936002)(14454004)(42882007)(446003)(11346002)(186003)(486006)(102836004)(71190400001)(71200400001)(1076003)(9686003)(6512007)(55236004)(478600001)(4326008)(33716001)(2906002)(6862004)(6486002)(25786009)(66066001)(6246003)(6436002)(99286004)(26005)(44832011)(8676002)(7736002)(76176011)(256004)(14444005)(66946007)(229853002)(66476007)(305945005)(66446008)(64756008)(66556008)(52116002)(58126008)(81156014)(8936002)(81166006)(316002)(5660300002)(54906003)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1485;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pm7yEJ5LkW0n/3rwfcWJmx9s42ICVtYDc468f2+b2GrGPc2L1pfMiwOq6pr1MvYitOabv3QbH3Q4eQonNu6MyW0Qn+4lDhasXEgGAewDKU3lY4L5y4xNwHi5ZZp2xNnjmq/0r5VEhleeEggGfa6fOQu0A4wgZRPIdTLMIpWJ16VVttWRq08IrRCHYKYRPMB7G41j6WiI7B/pV/JVmSixvTlKMNzIue2rg7K/Zn/Vpxsad6f7eNYaoowqAU8hMgP0i8GUSvjvJzOEGvfs0yg8ACLON935u1v4KoYVo1eWM0XUCpd7wZmr1ZD3tgSJlBqC25BzbpWhh9YD0zjnCuqAjxb5b3PxTX47AKQ3+lS3YCgsOaqTG0EYMg0tl1ysj4raKNDR+bq+tOJ1cRzDCTulor+QV9NuIXjyDjrb2Z3+52o=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EC30B26113C2E5439F7657552FDF4D5D@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ac7b58c-29f9-400b-575b-08d731408676
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 14:02:30.4013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Fn5SznhqjVjvyuNuwYV2e+xtBAssU918pH2TAnQzuQNi8TOuGK9qWgHtDTT1iFc5+4kCU8kkuAy6Ea3fMAJlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1485
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Gary,

On Mon, Sep 02, 2019 at 09:02:32AM +0000, Gary Fu wrote:
> Add a cond_resched() to give the scheduler a chance to run madvise
> task to avoid endless loop here in non-preemptible kernel.

Thanks for the patch!

> Otherwise, the kvm_mmu_notifier would have no chance to be descreased

s/descreased/decreased/
(and in the comment too)

> to 0 by madvise task -> syscall -> zap_page_range ->
> mmu_notifier_invalidate_range_end ->
> __mmu_notifier_invalidate_range_end -> invalidate_range_end ->
> kvm_mmu_notifier_invalidate_range_end, as the madvise task would be
> scheduled when running unmap_single_vma -> unmap_page_range ->
> zap_p4d_range -> zap_pud_range -> zap_pmd_range -> cond_resched which
> is called before mmu_notifier_invalidate_range_end in zap_page_range.

I'm not entirely sure I follow - could you clarify whether the task
invoking the madvise syscall is related to the task using KVM?

> Signed-off-by: Gary Fu <qfu@wavecomp.com>
> ---
>  arch/mips/kvm/mmu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
> index 97e538a8c1be..e52e63d225f4 100644
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

Can we remove the need_resched() check here? cond_resched() already
checks should_resched(0) which tests the same thread-info flag as
need_resched(). So we should be fine to just call cond_resched()
unconditionally.

Thanks,
    Paul

>  		goto retry;
>  	}
> =20
> --=20
> 2.17.1
>=20

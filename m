Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 878CCC29A7
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 00:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbfI3WfA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 18:35:00 -0400
Received: from mail-eopbgr730098.outbound.protection.outlook.com ([40.107.73.98]:17664
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727681AbfI3WfA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 18:35:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSvIt3aUl41Msh1uLvggKKIHpVfem6ot6XyQNLM4wjgYIhcwHNmAm7Sph9pvPvF2kJkF2cjVI+ok8oaKdXaA/R629nkkXnVOGM+AnMJCJNZPugoV8Z2E2u17nVRiWeHjPIsFE/FHX4QuXNnaTlbMFidbuYeLQ/YMc95hK1fn4PUcmJjvtCGYTi+zMWwk0sd+mFuISFL1h8thI2QdCIJwuRh/PKjSTuMRCJES4LgfG19ylHwB/MknMJfua+ajTye4Z50We69bIB33vk9TrUPL/7OArNPpoQZ5xSMh5qOdIwrAVz+yyd42KTkHh/8reyVQke+UdmV61xBAN474M1YAjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzeG928AODIeWhB8wtVcFVETkxuUUIzTgdl7CfJllPw=;
 b=S0UVtvk3dD1BzVkU73myYm3jUjRzIxcEpcryfy9hUggOMsbRaOSZKGzt6hB77OYpLmLyK9xEKPqO+wnzyN2rRcOZpUVk6lPORV1kPBOw87ZeWOU0lHUOkz65scVmJlRvu/B6+upPh7xLl7QAc8qj0Z2pVtS+vN+Fr3UIHVPW9XiILcMQWalgwVeopkYp7+v/7OMnZ0F4OtBjMzVexu3CPeNLQNiNd2xOJXrUTebrmkIZcYIAYv/kCo3HwrA2XOdxdaZ/H51UxHLGRTDzZkbz/nBytN2LWLHXq74M02aOBArYhbkz5rBcUuL69KXUXK1BtH5kCqtL2I4sXQela4BtKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzeG928AODIeWhB8wtVcFVETkxuUUIzTgdl7CfJllPw=;
 b=Y+pXLlAMfVLYliF6xgj6/MIsXAeAW1Necupcxt+3BcfkC7+WeL0u66SW3dtc0UbqLxDAYXmnL70IlJGviRNfoDIrVrF18MJLGx8nAcsA2lRFaVVqyYYgvBYnaRp1EGSaAqFcnd0NzDqY88lXY+y6T2EW3j6IXyQy2DRNw3XQKHY=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1088.namprd22.prod.outlook.com (10.174.169.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 22:34:53 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 22:34:53 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: cpu-bugs64: Mark inline functions as
 __always_inline
Thread-Topic: [PATCH] MIPS: cpu-bugs64: Mark inline functions as
 __always_inline
Thread-Index: AQHVd99HhgQiWwNKWUyizdhbOnGX7w==
Date:   Mon, 30 Sep 2019 22:34:53 +0000
Message-ID: <20190930223452.ouznftjxryfp5zux@pburton-laptop>
References: <20190927053339.11866-1-jiaxun.yang@flygoat.com>
In-Reply-To: <20190927053339.11866-1-jiaxun.yang@flygoat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::31) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98464d13-4e8e-4389-5982-08d745f6699a
x-ms-traffictypediagnostic: MWHPR2201MB1088:
x-microsoft-antispam-prvs: <MWHPR2201MB1088E2307769B80349B28D60C1820@MWHPR2201MB1088.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(346002)(376002)(136003)(366004)(39850400004)(396003)(199004)(189003)(64756008)(66556008)(66476007)(33716001)(66446008)(5660300002)(102836004)(71190400001)(478600001)(66946007)(6436002)(71200400001)(6916009)(52116002)(25786009)(99286004)(1076003)(386003)(76176011)(6506007)(81156014)(8676002)(14454004)(3846002)(8936002)(6116002)(26005)(186003)(229853002)(7736002)(11346002)(446003)(42882007)(316002)(2906002)(6246003)(81166006)(6486002)(4326008)(256004)(305945005)(58126008)(9686003)(476003)(66066001)(6512007)(486006)(44832011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1088;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MIuu9cqn76XbKi2CrgRWGkPS6L2VU0qlxayxu3OGd4Pw1hBoIwmjgXDPLNEbfjV+IhOgwXjY741bxCNp/OTxTxF4QEUI2Soj1bnBJBzmJeJPWZKVoGCBStUrItYp56LBUMhVw5DE+kcR2TWVmdlvr/n8+Dg7raRCCUD67pv3ywIPO/v+WSPJGDpIr/boKQFIF2leCxA+cowuEr/5aggE3hFtOC4FogIu3zqaNWx3vTckrMpzwW7T73L2MpXyTdwcFmazXI5N89gabT0n9JPDPTluPqf6VXqeQKRg2MPcxdvbuFDFzTUT1bcN1oNt3bk+bIXr84xpMamFwef6bKLd7hFBBTSwrHr0+j32GKL73enpItPodjiEO+bfFnbdz1eYJYNoH9lRFKskeM6ptLhO8z83HdfAzJv7E7rbnq2PJ8c=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <38B23DEA41F84A41A9E7D57D0146D3B3@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98464d13-4e8e-4389-5982-08d745f6699a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 22:34:53.4587
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9gMghwc2sSa5aT5Jv4NpLSkQwKUhYnk61v1bw/cM+G+BL5HUQywjjJeQvRS5Hhbunp0L1oEgwF9duYWLEkQiVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1088
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,

On Fri, Sep 27, 2019 at 01:33:39PM +0800, Jiaxun Yang wrote:
> Commit ac7c3e4ff401 ("compiler: enable CONFIG_OPTIMIZE_INLINING forcibly"=
)
> allows compiler to uninline functions marked as 'inline'. Leading to sect=
ion
> mismatch in this case.
>=20
> Since we're using const variables to pass assembly flags, 'inline's can't
> be dropped. So we simply mark them as __always_inline.
>=20
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: linux-mips@vger.kernel.org
> ---
>  arch/mips/kernel/cpu-bugs64.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/mips/kernel/cpu-bugs64.c b/arch/mips/kernel/cpu-bugs64.=
c
> index fa62cd1dff93..93d23232357c 100644
> --- a/arch/mips/kernel/cpu-bugs64.c
> +++ b/arch/mips/kernel/cpu-bugs64.c
> @@ -24,7 +24,7 @@ static char r4kwar[] __initdata =3D
>  static char daddiwar[] __initdata =3D
>  	"Enable CPU_DADDI_WORKAROUNDS to rectify.";
> =20
> -static inline void align_mod(const int align, const int mod)
> +static __always_inline void align_mod(const int align, const int mod)
>  {
>  	asm volatile(
>  		".set	push\n\t"
> @@ -113,7 +113,7 @@ static __always_inline void mult_sh_align_mod(long *v=
1, long *v2, long *w,
>  	*w =3D lw;
>  }
> =20
> -static inline void check_mult_sh(void)
> +static __always_inline void check_mult_sh(void)
>  {
>  	long v1[8], v2[8], w[8];
>  	int bug, fix, i;

So far so good, I see align_mod() uses arguments in inline asm &
check_mult_sh() makes use of it (via mult_sh_align_mod() which is
already __always_inline).

I'd prefer that we add the __init annotation too though, even if all
it's doing is making it clear to human readers when this code can be
used.

> @@ -176,7 +176,7 @@ asmlinkage void __init do_daddi_ov(struct pt_regs *re=
gs)
>  	exception_exit(prev_state);
>  }
> =20
> -static inline void check_daddi(void)
> +static __always_inline void check_daddi(void)
>  {
>  	extern asmlinkage void handle_daddi_ov(void);
>  	unsigned long flags;
> @@ -242,7 +242,7 @@ static inline void check_daddi(void)
> =20
>  int daddiu_bug	=3D IS_ENABLED(CONFIG_CPU_MIPSR6) ? 0 : -1;
> =20
> -static inline void check_daddiu(void)
> +static __always_inline void check_daddiu(void)
>  {
>  	long v, w, tmp;
> =20

I'm not seeing a reason for always inlining check_daddi() or
check_daddiu() though - neither one appears to use arguments as inline
asm immediates, so I'd prefer that we just mark them with __init & let
the compiler decide whether to inline.

Does that sound good to you?

Thanks,
    Paul

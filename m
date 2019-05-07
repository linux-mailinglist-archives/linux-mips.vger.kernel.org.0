Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FB7316CF7
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2019 23:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728530AbfEGVPk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 May 2019 17:15:40 -0400
Received: from mail-eopbgr820103.outbound.protection.outlook.com ([40.107.82.103]:29708
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728551AbfEGVPk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 7 May 2019 17:15:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hefLwnBRmJs8igMSX30V4FwfFfZ1esF0+NquXycFYg=;
 b=AsgIrh4CvCWE7d2GcshFWNEBwXQX0ot2g6XOys9Cx4SxJqUkepetGfqb8vLMWwjWoA/jONMrM0Qwv7zwJWkMgE/c2t8riMszhjcDbhvO//Uk5kLzc2Pn8lhASSpxiPQ2ec4tTTg2hBdbQUzGRME0RWsoicofnJp3X/eAMmtWD/8=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1567.namprd22.prod.outlook.com (10.172.63.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Tue, 7 May 2019 21:15:36 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 21:15:36 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, "od@zcrc.me" <od@zcrc.me>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: jz4740: Fix Ingenic SoCs sometimes reporting wrong
 ISA
Thread-Topic: [PATCH] MIPS: jz4740: Fix Ingenic SoCs sometimes reporting wrong
 ISA
Thread-Index: AQHVBQzWtgDHX7GlGUuN4Nf63DDbiaZgKeoA
Date:   Tue, 7 May 2019 21:15:36 +0000
Message-ID: <20190507211534.ndtngk273ejrvfd2@pburton-laptop>
References: <20190507194101.17112-1-paul@crapouillou.net>
In-Reply-To: <20190507194101.17112-1-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::20) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 255f3284-ce72-4c40-f244-08d6d33125cd
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1567;
x-ms-traffictypediagnostic: MWHPR2201MB1567:
x-microsoft-antispam-prvs: <MWHPR2201MB1567A7A5DE373325A623162CC1310@MWHPR2201MB1567.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(6029001)(7916004)(346002)(136003)(376002)(396003)(39850400004)(366004)(199004)(189003)(386003)(102836004)(4326008)(305945005)(68736007)(1076003)(25786009)(7736002)(5660300002)(81156014)(81166006)(14444005)(229853002)(8936002)(8676002)(256004)(33716001)(66446008)(64756008)(66946007)(71190400001)(73956011)(58126008)(54906003)(71200400001)(6436002)(66556008)(66476007)(44832011)(486006)(52116002)(6486002)(99286004)(6916009)(76176011)(6506007)(11346002)(42882007)(446003)(26005)(9686003)(6512007)(186003)(3846002)(6116002)(14454004)(316002)(66066001)(476003)(53936002)(6246003)(2906002)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1567;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2LpgV6DEjeHmPj9zcbAFkVeQILvhqAFkmq4bHN0x1uCyV/5wsiRTkx07DtK+ha7wBsegnW03Pe3mttuoRbsqphN54Q3yGgrYCjZY37Q+SYHCyN5+h8vhZCcfr4H79/Hr8ajBMXzpbiAOIMqlEbDI8VxxapVRbkB4R9O7lI0Y5aLAB9TGmsZePxQdOG3t+oCk/xGHW0uzt4UmL1VDEVEwitgXjy66cgNAq2TmxgTsjZEtz+jkkaAbhKKBxcWrUtLxLDf5EHzCbmooIHm+3mC2wP0+bTWARwPBY3pfzltyYGhid6Obs2oUbJa5D3nohJHLFm7bKIXqsjRKlpnBRzk/hvWSp9j7ucthSZQu00cVrNKUVzTK2dT/1+GEYTFxR7/b6BkABdFlVLmLF8APn4lSen2L5jkN/NaRMhRejzaP76k=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DF7061DA30CB87459371CB956234EE06@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 255f3284-ce72-4c40-f244-08d6d33125cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 21:15:36.6220
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1567
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On Tue, May 07, 2019 at 09:41:01PM +0200, Paul Cercueil wrote:
> The config0 register in the Xburst always reports a MIPS32r2
> ISA, but not all of them support it.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/jz4740/setup.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
> index 7e63c54eb8d2..2508c026bdfa 100644
> --- a/arch/mips/jz4740/setup.c
> +++ b/arch/mips/jz4740/setup.c
> @@ -64,6 +64,7 @@ static unsigned long __init get_board_mach_type(const v=
oid *fdt)
> =20
>  void __init plat_mem_setup(void)
>  {
> +	struct cpuinfo_mips *c =3D &current_cpu_data;
>  	int offset;
>  	void *dtb;
> =20
> @@ -81,6 +82,18 @@ void __init plat_mem_setup(void)
>  		jz4740_detect_mem();
> =20
>  	mips_machtype =3D get_board_mach_type(dtb);
> +
> +	switch (mips_machtype) {
> +	case MACH_INGENIC_JZ4740:
> +		/*
> +		 * The config0 register in the Xburst always reports a MIPS32r2
> +		 * ISA, but not all of them support it.
> +		 */
> +		c->isa_level &=3D ~MIPS_CPU_ISA_M32R2;
> +		break;
> +	default:
> +		break;
> +	}
>  }
> =20
>  void __init device_tree_init(void)
> --=20
> 2.21.0.593.g511ec345e18

Would it work to check the PRID instead? That way we could keep the CPU
probing in cpu-probe.c, for example something like this in
cpu_probe_ingenic():

  if ((c->processor_id & PRID_COMP_MASK) =3D=3D PRID_COMP_INGENIC_D0)
    c->isa_level &=3D ~MIPS_CPU_ISA_M32R2;

That relies on the D0 PRID always being MIPS32r1 & other PRIDs always
being MIPS32r2 though - do you know whether that's the case? Our
comments in asm/cpu.h mapping the various PRIDs to SoCs suggests this
would be OK to me.

Thanks,
    Paul

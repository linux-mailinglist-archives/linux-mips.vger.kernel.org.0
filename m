Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83FCBC8F83
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 19:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728199AbfJBROg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 13:14:36 -0400
Received: from mail-eopbgr690098.outbound.protection.outlook.com ([40.107.69.98]:60710
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728149AbfJBROg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Oct 2019 13:14:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJCovABkeFGMj0MJ4jXs/7Ypu8fRRRKr94JUzJlx7E7SEeFiwSerBTYK+1MXNVOUz1gid8MITgZJB06Eio9wrL3vFHbK7UD0lPRkTCLTlwJrGPUwTG7SxsBOwK9POTDh/t5id3dtFNn7S8+zmlI5XfkVDe6ak4XwbNPW4DhlRhdH8WZ7d/wrDoH6pfhnZMS/dDRuJ3MzReC3E+moF6L/VcHqhiN/uJid/wOk3vvN8qVwh7d5EK7UMRwzUFFjlNyNxu2vT0pBzrg7AYrcLL2AuIEacRX8D2Jfe6KvGxWA2IPJNtGzkqEoyi4IjYmC/99B4zQxtAnL1ARyMViRq9rTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WG/16uns95m8iiPc/tsEWzSuSVDWlnwEWNuKqiPtmd0=;
 b=G8WPyj0MN5RaUL+hWT3edTGRpHMKg5wvG0FEt6JdVc3YompHrUrZZBGM+j8LASTUgZhqPbxPkbugPOcXG0tB8PcdhXNj/5xOvMxrrrtZtcc7dBU2WsCiiAdQx/CBn52T4EFQ67pOqAuEaKWc/SrvB06SttGOh6yiaDw4nOZkxolqMFzGJRaYxWxGeUQMJFneE9ugx+7WLSqW6mPdF3+Qm3vLPztPiRX+wCN5BwPnK3CFpDT6FNzyOBIL8cNjEYmwJzfnlqQhHxsZwwkXNAP7zXtoCEXlqFunWvzBVLGCWsdZMapRchdq+aJ4FSSjOzrJsFy2SNyWQAgIHNst3W/iSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WG/16uns95m8iiPc/tsEWzSuSVDWlnwEWNuKqiPtmd0=;
 b=DAKoCadUU+32PMe6lKNWD+PLe7U9CP43oz83lbICGmEmb4V6NmZdTKObjuc+pu1CblVxxU6bQrJuWkwlGrc/hUVc1L5n9BN4nuWSed5QEQ0hzs/fALgp2iWZbfF6ynHT7DD33z8E/e81781r1dpUdxQWmpRHk8lS+XX1UmK2fNU=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1759.namprd22.prod.outlook.com (10.164.206.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 17:14:32 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 17:14:31 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: octeon: Include required header; fix octeon
 ethernet  build
Thread-Topic: [PATCH] MIPS: octeon: Include required header; fix octeon
 ethernet  build
Thread-Index: AQHVeUTaE242exN6yU6adRnp4AQQRw==
Date:   Wed, 2 Oct 2019 17:14:31 +0000
Message-ID: <MWHPR2201MB12773A25D55977CA6ABA0D56C19C0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191001215622.4173931-1-paul.burton@mips.com>
In-Reply-To: <20191001215622.4173931-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:a03:180::43) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1568fdba-8ecf-4413-c81f-08d7475bfd37
x-ms-traffictypediagnostic: MWHPR2201MB1759:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB17592C77018918C09ABF16ACC19C0@MWHPR2201MB1759.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(346002)(376002)(136003)(39830400003)(396003)(366004)(199004)(189003)(14444005)(256004)(52536014)(4326008)(6306002)(9686003)(26005)(14454004)(52116002)(55016002)(478600001)(42882007)(6862004)(6246003)(229853002)(966005)(71190400001)(6436002)(71200400001)(8676002)(81156014)(81166006)(476003)(8936002)(486006)(74316002)(33656002)(44832011)(7736002)(54906003)(11346002)(3846002)(316002)(6116002)(2906002)(25786009)(99286004)(446003)(76176011)(102836004)(5660300002)(64756008)(66446008)(66556008)(386003)(66476007)(186003)(66946007)(66066001)(305945005)(7696005)(6506007)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1759;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: axSEe5EO6W5RmGvltjBkbx26QsjI56OO3Kr12U2feqKVAJsMp21maxWVS35bevC5A0G/wAMXpUNRN9izxu3Tqq82AJsANe/BEYZyNFqz04u8pudVN2zIHUE+rEbhGkJrVhwxcT3JquxN3bvmhxm2AZbs6QctbXSbhDeti05woyL2C0rnMNyzM7QE7kNSpkgSZUO/RirTRfTOocW8YJSUry39rnj+0Ja9dWH2R5jzAhLtft+MZHRlap92qICaxuSzeiIzFkHucEURZd1PTQntS+uYVckCPZsDJIfR4esnrb92tyr9aNgN6d6V4ngxHejvWjbuTUnamu41dRbQfGFlQYGS8TAYjOqvtNIEDKAge3P8kkqVvB7jtPJK7aumGIWYZix/rVKuKuxp9BMXtqW4nKtsTGtI6Wm8TlwHHF+iS7ZJD9sf4iblcSW5Racoxm0m1mlft4vMyvtYEHZvVbVdEg==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1568fdba-8ecf-4413-c81f-08d7475bfd37
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 17:14:31.6809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JcbyZOOcabCxolbN85gvbnYVMnwuSAAJgMvRS7Bn8lqqUZBtBNOonchGbAEr2mB47/tkJV9ikm3aP+FdacEtSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1759
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> Commit 171a9bae68c7 ("staging/octeon: Allow test build on !MIPS") moved
> the inclusion of a bunch of headers by various files in the Octeon
> ethernet driver into a common header, but in doing so it changed the
> order in which those headers are included.
>=20
> Prior to the referenced commit drivers/staging/octeon/ethernet.c
> included asm/octeon/cvmx-pip.h before asm/octeon/cvmx-ipd.h, which makes
> use of the CVMX_PIP_SFT_RST definition pulled in by the former. After
> commit 171a9bae68c7 ("staging/octeon: Allow test build on !MIPS") we
> pull in asm/octeon/cvmx-ipd.h first & builds fail with:
>=20
>   In file included from drivers/staging/octeon/octeon-ethernet.h:27,
>                    from drivers/staging/octeon/ethernet.c:22:
>   arch/mips/include/asm/octeon/cvmx-ipd.h: In function 'cvmx_ipd_free_ptr=
':
>   arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: error: storage size of
>     'pip_sft_rst' isn't known
>       union cvmx_pip_sft_rst pip_sft_rst;
>                              ^~~~~~~~~~~
>   arch/mips/include/asm/octeon/cvmx-ipd.h:331:36: error: 'CVMX_PIP_SFT_RS=
T'
>     undeclared (first use in this function); did you mean 'CVMX_CIU_SOFT_=
RST'?
>       pip_sft_rst.u64 =3D cvmx_read_csr(CVMX_PIP_SFT_RST);
>                                       ^~~~~~~~~~~~~~~~
>                                       CVMX_CIU_SOFT_RST
>   arch/mips/include/asm/octeon/cvmx-ipd.h:331:36: note: each undeclared
>     identifier is reported only once for each function it appears in
>   arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: warning: unused variabl=
e
>     'pip_sft_rst' [-Wunused-variable]
>       union cvmx_pip_sft_rst pip_sft_rst;
>                              ^~~~~~~~~~~
>   make[4]: *** [scripts/Makefile.build:266: drivers/staging/octeon/ethern=
et.o]
>     Error 1
>   make[3]: *** [scripts/Makefile.build:509: drivers/staging/octeon] Error=
 2
>=20
> Fix this by having asm/octeon/cvmx-ipd.h include the
> asm/octeon/cvmx-pip-defs.h header that it is reliant upon, rather than
> requiring its users to pull in that header before it.

Applied to mips-fixes.

> commit 0228ecf6128c
> https://git.kernel.org/mips/c/0228ecf6128c
>=20
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Fixes: 171a9bae68c7 ("staging/octeon: Allow test build on !MIPS")

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

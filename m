Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 522137AFB2
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2019 19:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730560AbfG3RVr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Jul 2019 13:21:47 -0400
Received: from mail-eopbgr790123.outbound.protection.outlook.com ([40.107.79.123]:3344
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725889AbfG3RVr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Jul 2019 13:21:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ntv7f13NbRh4JLVhHiELDxUK670ctyKoGfYdzLdTS0iruLsOBSJoWHEp3sFqiqa/A/x9iahzsfGYKBJ1HoZMu9s1BIsp07YJF9FulXd9KSJz0OW5c3vzRFx0Zk7GWNzFzcdT36Q6I9GrvlfBnm4Yv/NKGtLqx/nVhx8188OGb7Jx57OwF3cc8+3MDloy+dEhhlarsZS7+hNm6XfWDhqhoWfBfLcXlRIdrIEewLvQfcx3+pql2i2SBJbUX35QwkGfZlSwEaVJgiIBN4suBI9gTXqDW3e6Fw269f8sgFVIIi8fBU8fTmYzMsFaLL+az608IsHIxSQXHwyjpJ+SB/r9Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQK/3QnaEpmGibszKj6jWvQpvjVsgdtuDl+tH/rasng=;
 b=eTspyQGch5zu9rYLXS7vXd80r5gXLRoKw2OQWDH8c1Xte4ZrLeAsmRNzFqW3IkXMQH8E5+RNBB2HCLNEC5+SSUm922r9dTgWvzqhXNdFOa7l5ZZuaCIVP6KRpGHsRaG/rPKk2lyf1f+fPR+tPJ0uxIl1GOEym4y9jXF6fGMvfOewag2xcLVj9YL3maAL6EzrKepjphQ7YssQUzQm6qdswfEy6I53ctgf/dwSynddkdluyAVMe/IiMsAdDrX89OWcXCbbYl0ZXLytUPJITmjKXIOgH46sAuhoVfOzK9BDSSol0HLzokVtKMquhynDPAOY4pmDqamoISzo/9R/1zqArQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQK/3QnaEpmGibszKj6jWvQpvjVsgdtuDl+tH/rasng=;
 b=TMkvseJssP+jXLrrluSHg6loWQ90CztVZzojk85Lkwa+xaeT4fmO+6p6gspNnZ4pQ4XgxQof1rC9YDtIgibT43mWnBAy2xrsy1jp84JNqj3bolln0ub/tJhsVRBS3yhC4JULRC0NwMEo7jVDj5y6wBCQRC3TJ5TEjqMs/tvq21w=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1565.namprd22.prod.outlook.com (10.174.160.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Tue, 30 Jul 2019 17:21:43 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::105a:1595:b6ef:cbdf%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 17:21:43 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
CC:     Nick Desaulniers <ndesaulniers@google.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
        Hassan Naveed <hnaveed@wavecomp.com>,
        Stephen Kitt <steve@sk2.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH] mips: avoid explicit UB in assignment of
 mips_io_port_base
Thread-Topic: [PATCH] mips: avoid explicit UB in assignment of
 mips_io_port_base
Thread-Index: AQHVRvtBHPSEeFogTEW9DwXoOEX0HA==
Date:   Tue, 30 Jul 2019 17:21:43 +0000
Message-ID: <20190730172141.addbdma5dnihdwoc@pburton-laptop>
References: <20190729211014.39333-1-ndesaulniers@google.com>
 <alpine.LFD.2.21.1907292302451.16059@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.1907292302451.16059@eddie.linux-mips.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0071.prod.exchangelabs.com (2603:10b6:a03:94::48)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b162f964-f5b9-4393-ab66-08d71512642e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1565;
x-ms-traffictypediagnostic: MWHPR2201MB1565:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR2201MB156564025C9D2A039315989DC1DC0@MWHPR2201MB1565.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(376002)(346002)(136003)(396003)(39850400004)(366004)(189003)(199004)(66476007)(66446008)(68736007)(11346002)(6306002)(81166006)(71190400001)(81156014)(8676002)(7736002)(71200400001)(3846002)(966005)(7416002)(14454004)(6436002)(2906002)(25786009)(478600001)(9686003)(6916009)(6116002)(8936002)(6512007)(58126008)(5660300002)(53936002)(1076003)(6246003)(446003)(102836004)(52116002)(33716001)(66066001)(42882007)(186003)(26005)(54906003)(476003)(6486002)(256004)(44832011)(229853002)(305945005)(486006)(76176011)(99286004)(6506007)(386003)(66946007)(316002)(4326008)(64756008)(66556008);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1565;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gZiYHDEiDFjypR5pnlBy19xkU0z4cDTtiEjum/3BRW/0WEwajRI5iafCVADQnaVQmiO7znJvcwMBMwPBe5ZKfKe/IDrsCIPBZoizMZjH2+YoxEHJF6Vawa/iAmvxwbu1jEGhx6RKiXuIvbH9npldKeEQ8W9u3cxuq/CRjw1n6UO7+aIWQNnPk70w+tvhe+JPPEfUPDeP9MFbaPV8IYR1Zq3CBsEBw9sAIr3X4FoPrjtkz0d6kNQ3i/AZqGLYUV6Osl5/5kv81Tff5c0KHqOdIK5iejJhr8uJH0j5BIz6d+N6PNSoimbi/+vdhVztapHLB2bbdv/31vRlzbKCKds4Gb5rLQ5tnP9XcfZYEGb4FxZ6ua7/l6tuQHd0FqeOogiuQLzCeObQMXVVzWXqfmaW3/e3Fpi8RO5vKVS+LjhiygE=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6616E1CE16706A419E23980E4D8E25FE@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b162f964-f5b9-4393-ab66-08d71512642e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 17:21:43.3101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1565
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

On Mon, Jul 29, 2019 at 11:16:45PM +0100, Maciej W. Rozycki wrote:
> On Mon, 29 Jul 2019, Nick Desaulniers wrote:
> > The code in question is modifying a variable declared const through
> > pointer manipulation.  Such code is explicitly undefined behavior, and
> > is the lone issue preventing malta_defconfig from booting when built
> > with Clang:
> >=20
> > If an attempt is made to modify an object defined with a const-qualifie=
d
> > type through use of an lvalue with non-const-qualified type, the
> > behavior is undefined.
> >=20
> > LLVM is removing such assignments. A simple fix is to not declare
> > variables const that you plan on modifying.  Limiting the scope would b=
e
> > a better method of preventing unwanted writes to such a variable.
> >=20
> > Further, the code in question mentions "compiler bugs" without any link=
s
> > to bug reports, so it is difficult to know if the issue is resolved in
> > GCC. The patch was authored in 2006, which would have been GCC 4.0.3 or
> > 4.1.1. The minimal supported version of GCC in the Linux kernel is
> > currently 4.6.
>=20
>  It's somewhat older than that.  My investigation points to:
>=20
> commit c94e57dcd61d661749d53ee876ab265883b0a103
> Author: Ralf Baechle <ralf@linux-mips.org>
> Date:   Sun Nov 25 09:25:53 2001 +0000
>=20
>     Cleanup of include/asm-mips/io.h.  Now looks neat and harmless.
>=20
> However the purpose of the arrangement does not appear to me to be=20
> particularly specific to a compiler version.

Agreed - I don't think the code here talks about compiler bugs at all,
it talks about emitting extra unnecessary loads & says there's a codegen
"issue" which I interpret in this context to simply mean that the
generated code is suboptimal.

See also this previous patch which aimed to remove the const too, though
for other reasons; namely LTO:

https://lore.kernel.org/linux-mips/20180616154745.28230-1-hauke@hauke-m.de/=
T/#u

As I measured there this does indeed have an impact on code size, though
it's not infeasibly large or anything.

> > For what its worth, there was UB before the commit in question, it just
> > added a barrier and got lucky IRT codegen. I don't think there's any
> > actual compiler bugs related, just runtime bugs due to UB.
>=20
>  Does your solution preserves the original purpose of the hack though as=
=20
> documented in the comment you propose to be removed?
>=20
>  Clearly it was defined enough to work for almost 18 years, so it would b=
e=20
> good to keep the optimisation functionally by using different means that=
=20
> do not rely on UB.  This variable is assigned at most once throughout the=
=20
> life of the kernel and then early on, so considering it r/w with all the=
=20
> consequences for all accesses does not appear to me to be a good use of=20
> it.
>=20
>  Maybe a piece of inline asm to hide the initialisation or suchlike then?

That could work as a replacement hack. As I mentioned in the thread
linked above a less hacky, though more extensive & invasive change might
be to move our I/O area to a fixmap which ought to produce even better
code since the addresses would become compile-time constant. I'd settle
for either approach for now though.

Thanks,
    Paul

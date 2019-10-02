Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B62E0C903E
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 19:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbfJBRvp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 13:51:45 -0400
Received: from mail-eopbgr790114.outbound.protection.outlook.com ([40.107.79.114]:62112
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727883AbfJBRvo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Oct 2019 13:51:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3RT8l7uFExRB7OkHUAVplTTbEt/9rj1Vf3BZcajvRNTbx2KNN8iLkdfmN5CIH1u3N/aoJNYsojLb7TK8DPwGn+qQ/EU5VWyQ0RYHUp43TnwY0LJC0o1CcHhrgDHR9I9Tm7UWziBd80844/iS6TmCC0FjiMG27cyiY3tRLdyTE8THq5ydT3b+X0IE1hbq4JqoSkY6A4pDUe0kKozk4Tlvnr9poPfOzS/bDfJ8IcckfCVAlgQW1+gnLGuf14jJKZ7Jn13K2VFZAONiLliQPkvWdz/02BAt0/zaF9MEDk98HfbjbHEmmvWKC/AzgWTp//eoNow1aokSrVTjJMPv3RcLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ou0ZMCPjm20WTETaxPYXYOkjSt7ku8tiSmTwSGHm41A=;
 b=MrTp1AqGGZp9LmjnbEvruaH3zNFIf/BksUQNeeLTmRUDZC9e2kkxpdtkPprApA/mcugjeylZyitTwebyfS9WB1PRRwTsCiv0lkapSIaTPD0VcYLWM2e6puQstCEVOQho4qA19m9H9XokJY56KuH5iVKun99MVB29wqHH1DjdFH8vXGMkL4Wo4lwbFqiitYG6qcO4Z+VVB7AsxkT77AX3j6w6UOw/OZNZ8cPeLuLtQuZJiKjxWp8e8HcOKGY3km4NYNED5a4H3mxuxDT/B6LcBHn0fsgH8UjnxuiFP1LDzKbVhhPiKlG2JPZPXSghkmxUX62tj/KIw7MEX6wghE8dvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ou0ZMCPjm20WTETaxPYXYOkjSt7ku8tiSmTwSGHm41A=;
 b=gAkFzrNhMg8CgjOkE98EUTZCmmjhmhl4g0RM40VLKIIcj90Dgm/xOJGxRV5XhF5NBkvvgRIztHcNNKiQA/RYI48TL/awiIrfn/hNKFU4uinSnkeMh75X4GPQ3PZASaEEGqaWPT0ed51CRHNIi7eklXioQIqQ84Sydy9K5hf7mUQ=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1582.namprd22.prod.outlook.com (10.174.167.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Wed, 2 Oct 2019 17:51:41 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 17:51:41 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Daney <ddaney.cavm@gmail.com>,
        Alex Vesker <valex@mellanox.com>,
        Matt Fleming <matt@codeblueprint.co.uk>
Subject: Re: Build regressions/improvements in v5.4-rc1
Thread-Topic: Build regressions/improvements in v5.4-rc1
Thread-Index: AQHVeUoMBJ4wgZGrM0q/CkOKKS1F+Q==
Date:   Wed, 2 Oct 2019 17:51:41 +0000
Message-ID: <20191002175140.b4ejnamkjiz365o2@pburton-laptop>
References: <20191002085809.16381-1-geert@linux-m68k.org>
 <CAMuHMdUHG-4=HEOspGH=-6P_nTdbR_wYnyKdyUR9+-2=r1fNkQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUHG-4=HEOspGH=-6P_nTdbR_wYnyKdyUR9+-2=r1fNkQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::38) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 120a2c1c-dbc3-48fb-fbb5-08d747612e66
x-ms-traffictypediagnostic: MWHPR2201MB1582:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR2201MB1582A516822C1466E0A15F62C19C0@MWHPR2201MB1582.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:125;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(366004)(376002)(39850400004)(346002)(396003)(136003)(189003)(199004)(42882007)(81156014)(102836004)(229853002)(25786009)(316002)(6512007)(6246003)(9686003)(6306002)(186003)(6436002)(8936002)(6486002)(6916009)(14444005)(81166006)(52116002)(26005)(99286004)(256004)(8676002)(33716001)(44832011)(1076003)(66066001)(6506007)(66946007)(71190400001)(76176011)(14454004)(71200400001)(966005)(486006)(478600001)(5660300002)(4326008)(54906003)(7736002)(446003)(11346002)(476003)(66446008)(64756008)(6116002)(305945005)(66556008)(2906002)(3846002)(66476007)(386003)(58126008);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1582;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9dCF8IVlunofqermplfLLbzFQgAujQRYyrW2tUP32KqaHKx1Vaj3ypaUZpJPaHrZ8UMwzJ4GHYdRGEt2HCKwFV5jEJ1nixVrHkLvUEOY4ah3w4oE/qzJ6sMGKcRfx5Wp473H8m8R92s6hRxMzfJfsD/uJHO6GynvsYOhqQea0OESizqdUcGdXqmOFiLZGS3ol657dA1UdTiBCBNct8CrS5MfrbYaOxb2BVXVTs+EVJhxZNAu1E/SlsC7rXhqcEp6ND4er4i7eeIp/Icko75sezTUICDu1Q9b7zwcYRGozvGIAgF+YbCvL17QKzYLDgnYyOPdq3xIn2/4kQ/IzM4/bdbOFJX4eZLIXTJIe/C4DRbDBfiu5LZswxd/C6q30aEAuZdfuBioiPtUhIy9KfXIQ9fOFDt7VDP6lrilrjNllWz9CErEI0YPEsvRxQhZVKSeeC4gapsdRtlhjmVmGuPU9A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DB51F5C535F0704392DD215CE7487E5D@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 120a2c1c-dbc3-48fb-fbb5-08d747612e66
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 17:51:41.4574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: syLvhjyzZung8kZJmngKwGUG5vAV8UAYOR6D0d+4d7n4S5CQkIL4KxInEi4n1kkuZr6uSpsZjyNMzSPvXWW8SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1582
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Geert,

On Wed, Oct 02, 2019 at 11:17:26AM +0200, Geert Uytterhoeven wrote:
> > 15 error regressions:
> >   + /kisskb/build/tmp/cc1Or5dj.s: Error: can't resolve `_start' {*UND* =
section} - `L0 ' {.text section}:  =3D> 663, 1200, 222, 873, 1420
> >   + /kisskb/build/tmp/cc2uWmof.s: Error: can't resolve `_start' {*UND* =
section} - `L0 ' {.text section}:  =3D> 1213, 919, 688, 1434, 226
> >   + /kisskb/build/tmp/ccc6hBqd.s: Error: can't resolve `_start' {*UND* =
section} - `L0 ' {.text section}:  =3D> 513, 1279, 1058, 727
> >   + /kisskb/build/tmp/cclSQ19p.s: Error: can't resolve `_start' {*UND* =
section} - `L0 ' {.text section}:  =3D> 1396, 881, 1175, 671, 226
> >   + /kisskb/build/tmp/ccu3SlxY.s: Error: can't resolve `_start' {*UND* =
section} - `L0 ' {.text section}:  =3D> 1238, 911, 222, 680, 1457
>=20
> Various mips (allmodconfig, allnoconfig, malta_defconfig, ip22_defconfig)
>=20
> Related to
>=20
>     /kisskb/src/arch/mips/vdso/Makefile:61: MIPS VDSO requires binutils >=
=3D 2.25
>=20
> ?

Hmm, this looks like fallout from the conversion to the generic VDSO
infrastructure. This patch resolves it:

  https://lore.kernel.org/linux-mips/20191002174438.127127-2-paul.burton@mi=
ps.com/

> >   + /kisskb/src/arch/mips/include/asm/octeon/cvmx-ipd.h: error: 'CVMX_P=
IP_SFT_RST' undeclared (first use in this function):  =3D> 331:36
> >   + /kisskb/src/arch/mips/include/asm/octeon/cvmx-ipd.h: error: 'CVMX_P=
IP_SFT_RST' undeclared (first use in this function); did you mean 'CVMX_CIU=
_SOFT_RST'?:  =3D> 331:36
> >   + /kisskb/src/arch/mips/include/asm/octeon/cvmx-ipd.h: error: storage=
 size of 'pip_sft_rst' isn't known:  =3D> 330:27
>=20
> mips-allmodconfig (CC Matthew Wilcox)

That one's triggered by a change in the ordering of some include
directives in the drivers/staging/octeon code, and fixed by commit
0228ecf6128c ("MIPS: octeon: Include required header; fix octeon
ethernet build") in mips-next.

Thanks,
    Paul

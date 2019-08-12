Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2802D89668
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 06:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbfHLEr1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Aug 2019 00:47:27 -0400
Received: from mail-eopbgr810104.outbound.protection.outlook.com ([40.107.81.104]:55664
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725648AbfHLEr0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Aug 2019 00:47:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrrTlkE7rTj3zYnkjq75e3YpckSA1AhZ/ds3qFOvwf2Jw3jtsq3eRru7+rv0b4nTLe/CsaKKl2f05PQEaMyQosYnX2dhdcnmpMxAc6uKPGpifE1z/bbsUGgBSR95Z0oog1s7lRwyOO9XtQxLZn7xcDt4syfPk9isYxhMT87WKGNG+Dtc09eFN7ZC5smv74PY1HQGCd91Dt4ewQAg57HuZ91lL6k7s1po4nwCfABQwXVkf5DxKL1gvDm+mmCJau6Q2Ho7rI8sCLbFRzpiYuotNgRcSJGeSKeipAalsyVOguXA3ysjXUybg4b1e8E9uTvpYLA7dquvrvvlI46viqXOdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2tPNjdEncHAYwHdvixqOdjOvU5ihiHWJvn2SpzvDzE=;
 b=ZWdR5x2/ZQRXQm5aMjeh50v11W+bldMXw76TM2zC59308I4Jy8UgjpaoAk5ytXySf+LnAxgccl5OaH7plTOsXpk91CNgUamaGb0pB+yNUIO+Sq4Ni1/dsgZvHNuC+JivUVn9LFrQnXowLkSONmSTt5XoApHPWtMAiMscu0zEE3l9L57/SkBduviLKhDL+nT5/yc3S10U1fZo+A1nQjHjR4dCUFgtV79ec7AQRtQ55+O467S9yfYeus7/5xKFiEb/XwesY4R+MBz8ZhMpfsGc8pnFZB4XvFFSgBVAfbt2Uao/3I8ap03Q4ONfNpPapheJFUFr1yFDIYpCMDtl/WDmXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2tPNjdEncHAYwHdvixqOdjOvU5ihiHWJvn2SpzvDzE=;
 b=nLca5kN2NCwH5LbuNLr6Czet4mPn5jbcmt2wgVszgaThU3G7sL4t+zoVE46pFEqGnegxEciw3e+MlGMs/Fl8JJrOxsynVJF+1zucn/OKeD/nvBSax8y/N0zw3rLXziKALifc+l/iplQhydWNyo1soniGedF4fNNor0zyQVoBcxc=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1469.namprd22.prod.outlook.com (10.174.170.142) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.22; Mon, 12 Aug 2019 04:47:24 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c%10]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 04:47:24 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Nathan Chancellor <natechancellor@gmail.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 5/5] MIPS: tlbex: Explicitly cast _PAGE_NO_EXEC to a
 boolean
Thread-Topic: [PATCH 5/5] MIPS: tlbex: Explicitly cast _PAGE_NO_EXEC to a
 boolean
Thread-Index: AQHVUMkILvVfiv8aFEiOoDD3+vloLA==
Date:   Mon, 12 Aug 2019 04:47:24 +0000
Message-ID: <MWHPR2201MB1277133CC3B57F621F359C42C1D30@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190812033120.43013-6-natechancellor@gmail.com>
In-Reply-To: <20190812033120.43013-6-natechancellor@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::16) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2601:646:8a00:9810:9d6:9cca:ff8c:efe0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cc0387d-80c0-410f-20d4-08d71ee02b3a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:MWHPR2201MB1469;
x-ms-traffictypediagnostic: MWHPR2201MB1469:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB14691DE2D27F520CA1D11C06C1D30@MWHPR2201MB1469.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(136003)(346002)(366004)(39830400003)(396003)(189003)(199004)(6306002)(81156014)(81166006)(8676002)(14454004)(9686003)(99286004)(446003)(7736002)(11346002)(42882007)(486006)(966005)(2906002)(476003)(25786009)(478600001)(8936002)(54906003)(229853002)(55016002)(6916009)(6436002)(1411001)(102836004)(52116002)(316002)(76176011)(71190400001)(71200400001)(66946007)(7696005)(64756008)(66556008)(66446008)(386003)(6506007)(186003)(66476007)(74316002)(256004)(14444005)(6246003)(46003)(33656002)(5660300002)(52536014)(44832011)(6116002)(4326008)(305945005)(53936002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1469;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rGjKCaWyb+XE8EnP03e6E6ZYq1IpdEQuBuScYz74iU0RVM63bMMiBV7zLRyad/X338GSWnO5eiBQOFjtsznAmzcFADJbU+sCymIeEB5GGpiieNf+AJiZuNrPWfuP6f3Z+4wdJjoUrLuo5H/eRlb43k+bGaIVrEJCp8zO30jUgDk7Xeoudr9A7nz6OAjImiWKwTrupy2fm+kx7QiwZLe3RVs8kuDLF28eVOZG6PRMtkdGFLHCHVzOJZvu/T8j4vAUT3B4QyFcmZF3bX9bNfti8cBsnVEbC9e+n723hqX3qVBLxfJcu/IbxWtgvwjy7vNU6OGut43JEBngifLfWTOJzmTQDO40AKwCzd+jmT2N0S2DlVj9H0yM8iPNnF9rt8jOobTVkpiN4/3gEmMSA/WsKbK3KttHAAAQk17r/uS+f5c=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc0387d-80c0-410f-20d4-08d71ee02b3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 04:47:24.4651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LASis2d6pZ8iQYJQmDmQ2G2tR6Flt/niO5CnB5Oz4codh/I0TnLU2vwAvQBQwfm3Q4MMk3zrfaw/aYf2fBv6Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1469
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Nathan Chancellor wrote:
> clang warns:
>=20
> arch/mips/mm/tlbex.c:634:19: error: use of logical '&&' with constant
> operand [-Werror,-Wconstant-logical-operand]
>         if (cpu_has_rixi && _PAGE_NO_EXEC) {
>                          ^  ~~~~~~~~~~~~~
> arch/mips/mm/tlbex.c:634:19: note: use '&' for a bitwise operation
>         if (cpu_has_rixi && _PAGE_NO_EXEC) {
>                          ^~
>                          &
> arch/mips/mm/tlbex.c:634:19: note: remove constant to silence this
> warning
>         if (cpu_has_rixi && _PAGE_NO_EXEC) {
>                         ~^~~~~~~~~~~~~~~~
> 1 error generated.
>=20
> Explicitly cast this value to a boolean so that clang understands we
> intend for this to be a non-zero value.
>=20
> Fixes: 00bf1c691d08 ("MIPS: tlbex: Avoid placing software PTE bits in Ent=
ry* PFN fields")

Applied to mips-next.

> commit c59ae0a10551
> https://git.kernel.org/mips/c/c59ae0a10551
>=20
> Fixes: 00bf1c691d08 ("MIPS: tlbex: Avoid placing software PTE bits in Ent=
ry* PFN fields")
> Link: https://github.com/ClangBuiltLinux/linux/issues/609
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

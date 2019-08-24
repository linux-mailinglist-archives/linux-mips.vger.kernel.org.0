Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3199BE2E
	for <lists+linux-mips@lfdr.de>; Sat, 24 Aug 2019 16:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727619AbfHXOMf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Aug 2019 10:12:35 -0400
Received: from mail-eopbgr780130.outbound.protection.outlook.com ([40.107.78.130]:19808
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727546AbfHXOMf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 24 Aug 2019 10:12:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BiVbijZdNusCV7VDK9RCOQviOXxktSFtjAEWul3DakzpBMbGL5NhL8CMq6h3/Ut8is7xqHDRvOQ5vfphHCoUwCrAaXm5Qgv7ObSLPfo99YcDWLg9x6Sjjz25kdyDGkI3gg/xjhohmZ6hmpUw0TcCOiIcd57zEXcIZc8VtqqQZLesMvd8aVV6DonBQqopHNZ3K/VKxeX0MpKg0Zsmwlln0TUqMlLUCxoof9DNWP8Awbvei2dk7v4GgV+Fw+5lba4XV3sTLAinC8JBxTNN5e+f3qeO+bvE2jqiz5zXtgg8aIUHAghrp4BhVY+bJRx28W3XZ/qUJTYqEHZOEINxzyNCqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqSQP5IHaznMy7vw5OFLKGiVE8efknV5xz9WEukBHAU=;
 b=bVaIGJzEIRwuy3ZpYWl0EFrq4FEYhUyAG8y1PypDYjYXIjDv72WXFxwYP0boYjZJ9djgEeTNw434ZZNKedLiJB9MelbeWH/WzXywVmK4xpHaErb7msVpzotHHo+QrVH90/dN9HaCcG9FlLaq6dXQNqK0oKPGNa1h/6U/Ul1WMDYTFVYatLe6RBlJt0zDPw4cqlQPUrDZnbId+wGRi6oVH4cwf3tiBPBkWDhRprkN+CtrFtjzJQzJ8+cee0e90EvLwhYr68pYVbfxxyZc4kFlLN1Ddha64tD6R1U2CTxBlWe0GrnvaHlcwh2IgWpRyaK2MXrVSuAOqMGoU1w37LIziQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqSQP5IHaznMy7vw5OFLKGiVE8efknV5xz9WEukBHAU=;
 b=U919u3E1VdJs10GPjhN9EM1z45OxWYFc2ohtdhswlleoc7TxNBkkuPHs63b68MSjZvBIlj/mvE/rx71buuhCylIknsugfCyMzbsg/ahtqhdveBAs4fjxXMSn3PuDaJ9D8UKwmH9g9kqC6prYztScZmF9Jbn1QATXkC/ERi77rqQ=
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com (10.171.214.23) by
 CY4PR2201MB1736.namprd22.prod.outlook.com (10.165.90.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Sat, 24 Aug 2019 14:12:32 +0000
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::2d81:1469:ceaf:1168]) by CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::2d81:1469:ceaf:1168%5]) with mapi id 15.20.2178.020; Sat, 24 Aug 2019
 14:12:31 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
CC:     "ralf@linux-mips.org" <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Hassan Naveed <hnaveed@wavecomp.com>,
        Stephen Kitt <steve@sk2.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] mips: avoid explicit UB in assignment of
 mips_io_port_base
Thread-Topic: [PATCH] mips: avoid explicit UB in assignment of
 mips_io_port_base
Thread-Index: AQHVWoX4JPcu9aL9pEei1FRjdW7LRg==
Date:   Sat, 24 Aug 2019 14:12:31 +0000
Message-ID: <CY4PR2201MB1272E45CC3592AE4D97EF177C1A70@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20190729211014.39333-1-ndesaulniers@google.com>
In-Reply-To: <20190729211014.39333-1-ndesaulniers@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0265.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::13) To CY4PR2201MB1272.namprd22.prod.outlook.com
 (2603:10b6:910:6e::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2a02:c7f:5e65:9900:8519:dc48:d16b:70fc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72e6581b-897c-472a-a2a1-08d7289d1a77
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR2201MB1736;
x-ms-traffictypediagnostic: CY4PR2201MB1736:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR2201MB1736D5EAEC132D2A2D384C4BC1A70@CY4PR2201MB1736.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0139052FDB
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(39840400004)(136003)(396003)(376002)(346002)(366004)(199004)(189003)(256004)(6116002)(4326008)(6916009)(8936002)(446003)(2906002)(5660300002)(6246003)(11346002)(486006)(44832011)(476003)(55016002)(42882007)(71190400001)(71200400001)(7416002)(6506007)(386003)(8676002)(7696005)(66446008)(64756008)(81166006)(81156014)(6306002)(66946007)(52116002)(6436002)(99286004)(229853002)(33656002)(74316002)(7736002)(186003)(305945005)(53936002)(54906003)(46003)(316002)(25786009)(9686003)(76176011)(66476007)(66556008)(478600001)(966005)(52536014)(14454004)(102836004)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1736;H:CY4PR2201MB1272.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hKCQGB9L8oa4/94lYyyFk2Bnu+QhsOhpxVBjfQkTMWGLx4DSsgIb/x5siR768JLPu4m54TKREE38jwYTFu1nrYBErrE6NQSWFbdTOTHYaRPRcFhUVm0SwpNi1fBGJxhEPezKR9lrZleDiaBp3wxHBSYNzc1VOWvDJ8CWcoYOY2wCz2pGCTeCYO17GihiMq3sobcdh4HarWlunqUHi5ejPUo980yzaUapZFw3uj2H6EmQBRbbIFL1awohJaNs8mlC+SP7xiorDV8mNP2Y/NsFU/4vmvHJanN6ysi3zaRoSdJ+w1RX/6wGS8uGDxXdcG6M+J3OndsdOsBhlY1QXWiDM49+EPp8dE6guUt3E4SadhUlRa3DX7DiLuBhk+m/0GxmT1kpwlWNwMwtaU/xV4l3XWSCwlf1yhOvLrq4BxzRCEM=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e6581b-897c-472a-a2a1-08d7289d1a77
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2019 14:12:31.7757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fLWq3gFrO/wTy22TFI74sE6kSdTCEwQoTRx8o3pCO6zi+PLAbaBj9daH4M+RFT2SHZrX2Pqen5Z9yW+6T4EtkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR2201MB1736
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Nick Desaulniers wrote:
> The code in question is modifying a variable declared const through
> pointer manipulation.  Such code is explicitly undefined behavior, and
> is the lone issue preventing malta_defconfig from booting when built
> with Clang:
>=20
> If an attempt is made to modify an object defined with a const-qualified
> type through use of an lvalue with non-const-qualified type, the
> behavior is undefined.
>=20
> LLVM is removing such assignments. A simple fix is to not declare
> variables const that you plan on modifying.  Limiting the scope would be
> a better method of preventing unwanted writes to such a variable.
>=20
> Further, the code in question mentions "compiler bugs" without any links
> to bug reports, so it is difficult to know if the issue is resolved in
> GCC. The patch was authored in 2006, which would have been GCC 4.0.3 or
> 4.1.1. The minimal supported version of GCC in the Linux kernel is
> currently 4.6.
>=20
> For what its worth, there was UB before the commit in question, it just
> added a barrier and got lucky IRT codegen. I don't think there's any
> actual compiler bugs related, just runtime bugs due to UB.
>=20
> Fixes: 966f4406d903 ("[MIPS] Work around bad code generation for <asm/io.=
h>.")

Applied to mips-next.

> commit 12051b318bc3
> https://git.kernel.org/mips/c/12051b318bc3
>=20
> Link: https://github.com/ClangBuiltLinux/linux/issues/610
> Fixes: 966f4406d903 ("[MIPS] Work around bad code generation for <asm/io.=
h>.")
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Debugged-by: Nathan Chancellor <natechancellor@gmail.com>
> Suggested-by: Eli Friedman <efriedma@quicinc.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

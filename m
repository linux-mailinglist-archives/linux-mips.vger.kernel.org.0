Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC3DBD3324
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2019 23:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbfJJVEg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 10 Oct 2019 17:04:36 -0400
Received: from mail-eopbgr800092.outbound.protection.outlook.com ([40.107.80.92]:23435
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726986AbfJJVEg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Oct 2019 17:04:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANoP7vvST9AinWLUjzaFRtGnEYqJlfSS6Rp0a5aURJ/z4Mww5Z+Os+sibCf4R+mwU15qBTcow0Jrb9U1P3ioaajxuv+zhWKVwjevrOvpkyL5ir1BeB/KLpUnfB/KuP+GdtIHWGsJxARqoGM0eIpVfCC3snQMlEMQJaI6wdygLiXnAP8cxUBojsTJm9i6LeqKEDk/GlO0i0487UI3fyifKnFiTOFaSbZd2PlXpIY67fcDn+jEzZUPuOVXbgo69EtCFB/GUtYSMf8JdcbKeArJj2+7XgRNKKwnZJQf0jUaeT+OFrHR3USd5b27rtZpTjfi4gFs8Dwnt5Au37Ex4If+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bU5Me7enwfA8VAvE54PrnHIecTtiHFVupcpOKg/XXqE=;
 b=QYpUUnXTgoLVqi5uUw+v0MZ71xchMFE1R3X5QbsEORMeTX4+UZzHQv23qSrOO5NqwuyBwScJhDLrC9yoKtZgs63X3BdPokjkklcbdTdPNanBX+mQpvBZMtayfnCu2ealqva/Nds1S3ZYHRfIPliRJf/kOEw/Cy/26J3tqGugwe8l9H9hxx6jjhrDseq8qbF5LqnqO7I2UgbeC0r0DzcrL+FdxrmELlOJZBt0drnJLHpGXLI9UraKIyg3iP8WWWkOt6NWqF1WzIsPuruO9dd4oGOh7FNW5M8/V84ErkET5u4eljnwYShl/fPATzUSL9bszqkoqARvxxgHs7ModBPriQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bU5Me7enwfA8VAvE54PrnHIecTtiHFVupcpOKg/XXqE=;
 b=W9XjitJVz0k0FSlnAmHCxbdVdCre0nHWrZExjWi9yJ6DYqf/EMJJG8QIWeQyM4fnmWznDL/db6tjXkmrrBFguw8hrGljYDm8i8xqOF1z8gh4BJ6BhBmc1goNjNoEnImY7CBnzTGjRm3UeG8WDkJ1QHBDjl4gG7p551fDvb4Yijg=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1279.namprd22.prod.outlook.com (10.174.162.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Thu, 10 Oct 2019 21:04:21 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 21:04:21 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Nathan Chancellor <natechancellor@gmail.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] mips: Fix unroll macro when building with Clang
Thread-Topic: [PATCH] mips: Fix unroll macro when building with Clang
Thread-Index: AQHVf65JWhHySr7ydUe0eu/Ed/jbNg==
Date:   Thu, 10 Oct 2019 21:04:21 +0000
Message-ID: <MWHPR2201MB1277296EAF034DFC726FF1EFC1940@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191010203159.20565-1-natechancellor@gmail.com>
In-Reply-To: <20191010203159.20565-1-natechancellor@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0022.prod.exchangelabs.com (2603:10b6:a02:80::35)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97f61870-1968-4b90-1702-08d74dc56bf7
x-ms-traffictypediagnostic: MWHPR2201MB1279:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB12799DAED4CA42269E83544CC1940@MWHPR2201MB1279.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(39840400004)(136003)(346002)(366004)(199004)(189003)(71200400001)(966005)(11346002)(446003)(71190400001)(486006)(478600001)(256004)(54906003)(99286004)(14444005)(476003)(4326008)(14454004)(44832011)(66066001)(66946007)(66476007)(66556008)(64756008)(66446008)(42882007)(52536014)(6916009)(5660300002)(102836004)(8676002)(81156014)(74316002)(81166006)(26005)(7696005)(52116002)(305945005)(76176011)(3846002)(1411001)(6116002)(6506007)(186003)(33656002)(386003)(316002)(25786009)(6246003)(6306002)(55016002)(9686003)(7736002)(2906002)(8936002)(6436002)(229853002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1279;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZbR1cgjsiBJoS7dM+CFycl888a2v9OQC0MWrtlCLzeqKpgls0wY9TYHE3CrR4VarkQrQesfD4DNGNu6nZ49fLKOf2DNMGvb3BYgFi5cH0PJ6A1+krgm2ybsEEnBodZCrnHbP5z8PkcXo/1jGmHjxSYrEyU6TyKvn6xaS3aEUO37NYeR3cM2cgxr4c5MvBT3s3kEud4TVo0V6Lbt4EpnDAtKwZyDFu6PrQk2BsPoxUshfMLh1ma+6K0V9VuIzzvHo1lWz56U19CP/BpV81gFqhP6Qp2O0paRSRGqXTK3tumbIWpGEUEG98v3flIWdoMSD4m1eCtrXMLhAx8sP7yHyWV94A8Vy3aHy0w6PhQ1AjJDiRLyK1XQzPrTXvKcOmyFats2iY8vLQaYOyeiQVz5f/ItTHnNV6N1+5jMBJHcchruB6gyFJU9hvqBctYxcuGhWY77IVoHySAoQYR6JwaBvsA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f61870-1968-4b90-1702-08d74dc56bf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 21:04:21.4574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LTK1snwJCTmU3SFsSyoZ+cjXOM/DT3gRF+TDFGp2tEUp7O+rmtX3/feuvNqNRV5z3Z32oLUVOUmqrtXy+CEkng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1279
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Nathan Chancellor wrote:
> Building with Clang errors after commit 6baaeadae911 ("MIPS: Provide
> unroll() macro, use it for cache ops") since the GCC_VERSION macro
> is defined in include/linux/compiler-gcc.h, which is only included
> in compiler.h when using GCC:
>=20
> In file included from arch/mips/kernel/mips-mt.c:20:
> ./arch/mips/include/asm/r4kcache.h:254:1: error: use of undeclared
> identifier 'GCC_VERSION'; did you mean 'S_VERSION'?
> __BUILD_BLAST_CACHE(i, icache, Index_Invalidate_I, Hit_Invalidate_I, 32,
> )
> ^
> ./arch/mips/include/asm/r4kcache.h:219:4: note: expanded from macro
> '__BUILD_BLAST_CACHE'
>                         cache_unroll(32, kernel_cache, indexop,
>                         ^
> ./arch/mips/include/asm/r4kcache.h:203:2: note: expanded from macro
> 'cache_unroll'
>         unroll(times, _cache_op, insn, op, (addr) + (i++ * (lsize)));
>         ^
> ./arch/mips/include/asm/unroll.h:28:15: note: expanded from macro
> 'unroll'
>         BUILD_BUG_ON(GCC_VERSION >=3D 40700 &&                    \
>                      ^
>=20
> Use CONFIG_GCC_VERSION, which will always be set by Kconfig.
> Additionally, Clang 8 had improvements around __builtin_constant_p so
> use that as a lower limit for this check with Clang (although MIPS
> wasn't buildable until Clang 9); building a kernel with Clang 9.0.0
> has no issues after this change.

Applied to mips-next.

> commit df3da04880b4
> https://git.kernel.org/mips/c/df3da04880b4
>=20
> Fixes: 6baaeadae911 ("MIPS: Provide unroll() macro, use it for cache ops"=
)
> Link: https://github.com/ClangBuiltLinux/linux/issues/736
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78760D1B4F
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 23:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732113AbfJIV7M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 17:59:12 -0400
Received: from mail-eopbgr690120.outbound.protection.outlook.com ([40.107.69.120]:50305
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730490AbfJIV7M (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Oct 2019 17:59:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5IjGRolhEe2TVZhI7MRMA9PgXgqmqJLH9WgFFBUakJ4Eqw4XOyGw28McSfa4BcbhUNtKbFPEVP6P2OtO2XpHoziAWQeefBmESouL1JgpCLBMhGhCvY5lXFXbKJL7fPzDKsa9wdiyxFAaJD/MJvfdr6s8TEj+BZ7ff/V3LFHGwrnXZcIiKh/nGOj6en96sejwLO1A4b4ffTd6m/3mM3k+38Yv95pvan0/JhSQ7ut/Vk8O+Qb9P8nYWtMESfhcJeSZvYzL8RD3bW000IQH31Dbs3O6VHXB3zLs1B8w2+Oq7j36JSNQqueM61Zm4aUx7o+EZfBAf3QIqDrzF2zhd74sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfyfl70xR1Inw1D/3YSKMd2GJwBzJtNTNlxxhhc6Bgg=;
 b=TMx8Pizo63HUiNsO1uWMtE7M3ZsRKSDHD6xPBiLBS5Kbmbl0UftsHqZ2Khsdk413HY+hPlmE4+jWOCntgZeC32m2GWwZPo5JSyJS5Vpjac13pzdurhbCGkQryuUGbpBBTOC0bjE1Iy7QZZJAg73IRqOESAF5aoAmhw1EDkANUzB/5HJnr3FZRc+w0B7Av/wCRkPYIxIAdBjk3Zs/znS39mYTCkpT4W53S9tGYWJDlq0vIJlv9BoI5z8trSLzOGjnTUkei5Q/TZgwRCMsaeLzwr/ovWUvVgUtp078K2DsFMr3fziEiio1BPvLD3tGh5sJkBfCRsrWWW6AZ0Qc7Fwybw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfyfl70xR1Inw1D/3YSKMd2GJwBzJtNTNlxxhhc6Bgg=;
 b=oGN0NPWp8JoxupGZ+5ee+nh7HE6NUlcxjzzilCNO8X8QGm/SFnkP1+XMMA/iUjdIHGBlqP6TbzmeHlpX+IrlgoOFWrEDB7Z8BEyCNUmbrLWuBL9wFVqQZwJ1mBu3AoWWhbgRXz8iKRwkZkChRTd7UqWnKSZeTg8oiLURl/h8upw=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1248.namprd22.prod.outlook.com (10.172.60.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 9 Oct 2019 21:58:39 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 21:58:39 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Provide unroll() macro, use it for cache ops
Thread-Topic: [PATCH] MIPS: Provide unroll() macro, use it for cache ops
Thread-Index: AQHVfgVGUUFiUFsiX0+VhTzRiJkYfqdS3VsA
Date:   Wed, 9 Oct 2019 21:58:38 +0000
Message-ID: <MWHPR2201MB12771DF0654CEFDA0E249AACC1950@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191008182149.2082503-1-paul.burton@mips.com>
In-Reply-To: <20191008182149.2082503-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::48) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d44bf81-260a-4f28-4438-08d74d03d72a
x-ms-traffictypediagnostic: MWHPR2201MB1248:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1248305AB9672DC94716F857C1950@MWHPR2201MB1248.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(396003)(366004)(136003)(376002)(199004)(189003)(102836004)(33656002)(11346002)(386003)(2906002)(26005)(6506007)(446003)(99286004)(71200400001)(966005)(42882007)(186003)(71190400001)(478600001)(5660300002)(44832011)(54906003)(316002)(476003)(486006)(9686003)(6306002)(305945005)(52536014)(7736002)(66066001)(6436002)(74316002)(8936002)(55016002)(81166006)(64756008)(81156014)(25786009)(6246003)(76176011)(7696005)(52116002)(14444005)(256004)(6116002)(6862004)(8676002)(66946007)(66556008)(229853002)(66476007)(14454004)(66446008)(3846002)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1248;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GXCIqKjjHB2mdFHgf7ZqYVxB07vdAp7PTJ5DqJHELg5IoF/fe8w9KhsDhqbSrmDI+LExoajNS73tKatVkn8gvS9kEuiYpLBFW/sKLqvoF25h2uZswsJhCoXMR9ukDaNziqPeHVNnPKbdAmSWbbvtjcUUDnbAq56QoWcnS7EcoAuuP7Kj9F+PonvyRoFUVV/m0NNrNpwXkUUW6cfqWgtzt1QTa57UUetpCZ3Emvm2ieQZGhGxsE6fa5Xb049AnwKru92oXklW3pFgK9Wk/9webV8JBJ53RmJj9oWOfee6bCD7dX4MCtyDEc8VnW8RLtAHjYEi40L/WDUHxQqinfpyS3wfMQLkASdMamSZjrgQlJe+MYkAOcX4wZqeYnCFi5s7n6+Rdl++6QrskpDsHtJ/OqWN+g5jmSIRUlK1oToW8RcjYSumvMH5EQfIMCzyOpZ7fvOOyFuISJYNCxTu3hERgw==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d44bf81-260a-4f28-4438-08d74d03d72a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 21:58:38.8845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4MOEggkUAhVdqyr5N/3fgjdlJYZ9AKz/mhav6Q2qCJGvRpoNUF1+EKctlUmz4MlTPAIhXaH7kA7y+U9rUGhaEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1248
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> Currently we have a lot of duplication in asm/r4kcache.h to handle
> manually unrolling loops of cache ops for various line sizes, and we
> have to explicitly handle the difference in cache op immediate width
> between MIPSr6 & earlier ISA revisions with further duplication.
>=20
> Introduce an unroll() macro in asm/unroll.h which expands to a switch
> statement which is used to call a function or expand a preprocessor
> macro a compile-time constant number of times in a row - effectively
> explicitly unrolling a loop. We make use of this here to remove the
> cache op duplication & will use it further in later patches.
>=20
> A nice side effect of this is that calculating the cache op offset
> immediate is now the compiler's responsibility, so we're no longer
> sensitive to the width change of that immediate in MIPSr6 & will be
> similarly agnostic to immediate width in any future supported ISA.

Applied to mips-next.

> commit 6baaeadae911
> https://git.kernel.org/mips/c/6baaeadae911
>=20
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

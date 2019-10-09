Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEBDD1B51
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 23:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732132AbfJIV7N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 17:59:13 -0400
Received: from mail-eopbgr800099.outbound.protection.outlook.com ([40.107.80.99]:6166
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730675AbfJIV7N (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Oct 2019 17:59:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ev6b7cTh9Z8o6iupH9Z2Csj8o68enDAy6w+xOhjzqP+aRW+MD7ttvhWbNqHnDnNKFzErHlmtPBlgBrNnppJCsTvYSlsyi+d1iNHybyu+r9ZLFLdQQV2pnzedD6j4jC57sI2RhUnLHvHOdOTMBjdjx4YNScXj3NaN8ccuZ3phujerEqwYv76Su5jmtSJncY/qT7+aB3iX4Qtpk6X+hwEKW3Nr2uB4zRDiKqc9FyA7w8dSYsp14IHSMLZy7a1XgXcYdyo2t6Qx3MiDQF0jSqUuSIj/LYlbeWMY6jW6q/6XoiJ6tCUD3Wn7+rkJW+4vJIIi75ogwgjxxZZ9FExRrephYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ga5gTV3F4KZzhI5Rmm5pumaqnBsg9pLhJM+twx1bJDI=;
 b=fRHcy6U2HlilAxDKdC8QXPZhjsQD0V5F7OTkGz3tHCySh/YvZ2QQkCEfUsFrFpaxA8TC562+wbOJS/NWHICZKDYk5BI3SDVFTbVQnqvSanvGGW+pT20VJcYdhBzyg7AZD2Wq2lBQhB1DThWYeuqMIhh6NbPT5X5jQzT5invSiQ6HYBjndTMyUmZ6K3XLORw+hkVJFARAiYapbtR2ipMjGBozHqyfKJ6JuE2O60FPxIWMJpPbiS+ae83VqbiLBfG+xBgzAE0e+p0dfTl7hqcaAhK8HVHRzVgfPZZ5nsiSELeGhs9nNPBykF145BjCSgz+eGogSQ3+i6GimxHjQW6BnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ga5gTV3F4KZzhI5Rmm5pumaqnBsg9pLhJM+twx1bJDI=;
 b=tMRa2Xncs8CQPYvoqF0VHblotn3K9t7ii41Y5eKFJC+bLcBO5MI+FbdqmaVO/ZSkhf1cPMwU2AzSPoBIdQu5o3cmxs/j0iE6LNYD3WbsJinqj2XZybQQ4uKAKVvvpUlxA6Kl38tRV4gwO5hyRfWIGe1+jzSQdY3HP1GX9D7+egU=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1248.namprd22.prod.outlook.com (10.172.60.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 9 Oct 2019 21:58:41 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 21:58:41 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        Alexander Lobakin <alobakin@dlink.ru>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Drop 32-bit asm string functions
Thread-Topic: [PATCH] MIPS: Drop 32-bit asm string functions
Thread-Index: AQHVfhED5+p9f9otwk+aE9NRlW4SnqdS3UeA
Date:   Wed, 9 Oct 2019 21:58:41 +0000
Message-ID: <MWHPR2201MB12771B06F7131C5B0B1089CBC1950@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191008194552.2176475-1-paul.burton@mips.com>
In-Reply-To: <20191008194552.2176475-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0004.prod.exchangelabs.com (2603:10b6:a02:80::17)
 To MWHPR2201MB1277.namprd22.prod.outlook.com (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81c637eb-36b7-4c5e-2e38-08d74d03d8dc
x-ms-traffictypediagnostic: MWHPR2201MB1248:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB12486474CB25B03C34A473C7C1950@MWHPR2201MB1248.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(396003)(366004)(136003)(376002)(199004)(189003)(102836004)(33656002)(11346002)(386003)(2906002)(26005)(6506007)(446003)(99286004)(71200400001)(966005)(42882007)(186003)(71190400001)(478600001)(5660300002)(44832011)(54906003)(316002)(476003)(486006)(9686003)(6306002)(305945005)(52536014)(7736002)(66066001)(6436002)(74316002)(8936002)(55016002)(81166006)(64756008)(81156014)(25786009)(6246003)(76176011)(7696005)(52116002)(14444005)(256004)(6116002)(6862004)(8676002)(66946007)(66556008)(229853002)(66476007)(14454004)(66446008)(3846002)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1248;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nucJbESuc6kXBQofnsZijWm1E1LwZP2t4IrrGy5ayQ+VcrnipEd83qBF0CRp7SdnPDnIEnDiUIgF8DoAN2UIEibHIbNZtxLfnIEFRqnERCPJRHMXqKJ/mW7Yn31FpfrjLKCfUJvuzKVA2COZ/vOeFbp9ffjaFHFvfoZz901oj3iifyo0xyWljkPDEUdXRpGd3Klwur6CJTtOScVWcBuuQrw3JabgezEGtuQUaeQx+hKsSXWZV1DHgemm4MnYtoSCRnZ5xwzCgBCx42Jsj4yzvF4c0YzOnsRAT8HtTmnmDNhNngn6xmfM2uwn0sX+ZspsrZNEkNLFJVgaVH8s25iMe5zv0TswF/YKUdnE1cChXF72iCGdVMBp3zzxT4f12zMvSk74DdM3u5umB5sKBDfTiJ/PFHWPPbLxjUdB+GMGw1QEOoyLeCsFjseWZiM4utPo7aU0kzb55XK/0V8zHXVnTw==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c637eb-36b7-4c5e-2e38-08d74d03d8dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 21:58:41.8501
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MN5xeWp2SW400PM8/MuxRijwcBAEU8GEyKdSNWjVAroToQOgp110bzccUT3kzDwpOCQVTAU69QRnKBK+LJoulA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1248
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> We have assembly implementations of strcpy(), strncpy(), strcmp() &
> strncmp() which:
>=20
>  - Are simple byte-at-a-time loops with no particular optimizations. As
>    a comment in the code describes, they're "rather naive".
>=20
>  - Offer no clear performance advantage over the generic C
>    implementations - in microbenchmarks performed by Alexander Lobakin
>    the asm functions sometimes win & sometimes lose, but generally not
>    by large margins in either direction.
>=20
>  - Don't support 64-bit kernels, where we already make use of the
>    generic C implementations.
>=20
>  - Tend to bloat kernel code size due to inlining.
>=20
>  - Don't support CONFIG_FORTIFY_SOURCE.
>=20
>  - Won't support nanoMIPS without rework.
>=20
> For all of these reasons, delete the asm implementations & make use of
> the generic C implementations for 32-bit kernels just like we already do
> for 64-bit kernels.

Applied to mips-next.

> commit 3c0be5849259
> https://git.kernel.org/mips/c/3c0be5849259
>=20
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> URL: https://lore.kernel.org/linux-mips/a2a35f1cf58d6db19eb4af9b4ae21e35@=
dlink.ru/
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

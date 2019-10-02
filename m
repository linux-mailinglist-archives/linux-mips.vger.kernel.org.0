Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F471C9479
	for <lists+linux-mips@lfdr.de>; Thu,  3 Oct 2019 00:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728026AbfJBWxw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 18:53:52 -0400
Received: from mail-eopbgr820109.outbound.protection.outlook.com ([40.107.82.109]:18160
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727103AbfJBWxw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Oct 2019 18:53:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjQTRW9Ae8+I1aDoavIimV7CkL48InVyqeVhsyDLigxejxc4s6eH5YOAdA1AWsRo79XQ59rzynzb1V+qEpkxeJu6YCvAcRgdU0NJuhb44AnE1mzjvXhr2+a6D8expjaMK0lOD1yrhZmdpuHca2pLK7SYcjsryOXaoVkxXca63Hul1G/17KPnCNERJ5ahsDHk5Rbw6l/w+FGW5LtTThW7ubuI3I9QoYyLO5pEE0+weHl2S+8Jb/hPD0+UsX75f57PQ/g3EMWs2iBF5bhvMxtZPaft02aifSpYNeIzuRq10IZqSkgekpDMIaFiV6RGKyO/ZaVO5BSpI5LI9tfnZdt3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGCrfQMsqsA0qLuRkktUjLYQK7imIHWCVdR+KFagy18=;
 b=iENNRo3Hwjx/yX4w9iBlYMLxymRlLDneHA1t7xzH3hKTpS69pWY6LFTCIRv9EAF+kexOR07zNqdgqSqwp4X3/J95gmB5ZPUbinum+XkmPPLtn9BEF+hpUr3HhG3YCtY0R6jChSzuaeg2SNwf+VuyOD1BpKPiZHMm4y4Imi1a5OfBZZgydZY10X/eEL1LmSqkbw3JOgUm2fKAgZidu7frANwgPsFpX/m/scQyBEKkIXJ4amjhlEejBNG+KT/mWMSUuEUiD+A2HEx97bsNg1SBwQnh661Rv5KH7Zr+3iYIc0w/5sxsDk+7JfFhbreDIBNzhX3E6pAUW7xlB4qRLD3Oxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGCrfQMsqsA0qLuRkktUjLYQK7imIHWCVdR+KFagy18=;
 b=KsmSl8IuNAsWb4VLWVaexLnbYdPRUeiVDc3MxVBN5EZ0Fz5eEek5c5otscpGEcQu8rUMRdEiUaPuSd2Nju/0U5B6vdYx3ulzwL2pBBeBTN8YxGskU+ArJKy03i5mrL6oj4/Iwbrsc6PAVE+psn+coSflSWnNvYDazEkBiCos9+g=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1294.namprd22.prod.outlook.com (10.172.60.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 22:53:47 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 22:53:47 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 1/2] MIPS: VDSO: Remove unused gettimeofday.c
Thread-Topic: [PATCH 1/2] MIPS: VDSO: Remove unused gettimeofday.c
Thread-Index: AQHVeUlKziXb77G6g0exbBt6BwBZK6dH9eqA
Date:   Wed, 2 Oct 2019 22:53:47 +0000
Message-ID: <MWHPR2201MB127723CED5EAE0F205D0BB18C19C0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20191002174438.127127-1-paul.burton@mips.com>
In-Reply-To: <20191002174438.127127-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::14) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23fc93df-49d3-4382-a1d0-08d7478b6206
x-ms-traffictypediagnostic: MWHPR2201MB1294:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB129438F6067F5816ABF722BEC19C0@MWHPR2201MB1294.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39840400004)(136003)(346002)(366004)(376002)(396003)(189003)(199004)(256004)(55016002)(478600001)(26005)(6436002)(186003)(316002)(74316002)(14454004)(4744005)(305945005)(54906003)(25786009)(7736002)(99286004)(4326008)(6306002)(52116002)(76176011)(6506007)(386003)(102836004)(486006)(476003)(42882007)(8936002)(446003)(966005)(33656002)(8676002)(11346002)(6862004)(81156014)(81166006)(66946007)(66476007)(66556008)(64756008)(66446008)(5660300002)(66066001)(2906002)(6246003)(6116002)(3846002)(44832011)(71200400001)(71190400001)(52536014)(229853002)(9686003)(7696005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1294;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ckZphCJyZ6GrSEOCPzqtaaquJQKZmnMzyy7yDiY+RAYKHWPKmW3nVKkF9PL4RqnDAgKZRMrT/Y5h493AHeAL9m0nAWQ8lUIzZYE8bAxhOJ0vVi+igq0qhEckYRP9AGzE2wBQUzjTGvUic8+/9b7rKx+Rm95pf7ePrahqw0Ji7U0Dt2NbSGri3P/BwV5ucHKd26IDJfEuJxNPZCeHJOnuK8bHQMO1lEvwkHKZKUYlr9PVI0l6o/rC5l+72iyaOrWWlu/KjXu9/lZq2daeqSHD2pQqeFwr3QTOrut2Erwdy4g62bXMsScr71fOLpSp6VWRENqB9xJIUHCX4tr+JmPfKwMbTMOpBFFn1O7oHgrHbQEYFR/KL2ya8WRTLIJFyk06mcV8roEmypizJvkjk5v6P+kSsFVjKz+UmA7BX3izFRVgUhxpWmPdmagCPhBHVJkVJuRerhv6Af5YrW4CKZFq4A==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23fc93df-49d3-4382-a1d0-08d7478b6206
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 22:53:47.1570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nmLhF51fHnSokVRQZ1MzlqITpGnkr2gwratdiKhKljozMj9BYpSUpqtDMr/vAa73plDaq5bEsArYd3aXhe/2iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1294
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> arch/mips/vdso/gettimeofday.c has been unused since commit 24640f233b46
> ("mips: Add support for generic vDSO"). Remove the dead code.

Series applied to mips-fixes.

> MIPS: VDSO: Remove unused gettimeofday.c
>   commit 90800281e761
>   https://git.kernel.org/mips/c/90800281e761
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>   Fixes: 24640f233b46 ("mips: Add support for generic vDSO")
>=20
> MIPS: VDSO: Fix build for binutils < 2.25
>   commit 8919975b6171
>   https://git.kernel.org/mips/c/8919975b6171
>  =20
>   Signed-off-by: Paul Burton <paul.burton@mips.com>
>   Fixes: 24640f233b46 ("mips: Add support for generic vDSO")

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FBFA94FAF
	for <lists+linux-mips@lfdr.de>; Mon, 19 Aug 2019 23:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbfHSVRV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Aug 2019 17:17:21 -0400
Received: from mail-eopbgr730116.outbound.protection.outlook.com ([40.107.73.116]:20088
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728014AbfHSVRV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Aug 2019 17:17:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DogJF37WdPkeGU25Rl0UfAf/IQ5NZcbB7d58UZrd2DYHMW0IbohHv0abvXD2gPonOZXKQ7bCGPGIR82bfO3uDSkzHxP8AZ6bPhkD7Itik3pubTsBIZjCTMLorQVLUxGlM84sTsvrvIQ6EmMGecQH5mh9vngeIrHlI0oSbfTJE2p11ZxxqmbgqfY3dcQlXY0S4DvoRH9WIofLde4dsCn/o5Te3KWWMqiCfk6O4vhKu3GpMkWEEmXkQcNS4gSMDyF7CgqXIV8zPDLLQEy7ifJIIdlh4CP14pOk/Jw5+iat3m+RicLJm4o1Zo0Q/CdK2jly3O62PZVHNJ/ppR1xUVEROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBC4NWHgeGQWLe4wO04CzGbRwYRK4NR5MKoRaPnJYA8=;
 b=fdeP8GYLZ33t9shQ8Kdfnue7eb8MpMZsuyUkNjtskC6Ni8vIjRuwfCh0qNfQ4Qk45nW4tmmzub6Z7UCaigJYuJmQg4tXFXNTLDIjPE3yjxGYwwmZmISULbrDmcMbjgGMDLucp3xNvO1hYNrvbjLnjYGcefqSboHeAv1UFzSz2ZpoTBjBCAJwISDz7Ma0LnYGscdON2xzJsVpR0nQtLRH+A+3u5fIpaeOVBLg9DyXRESeDIfwtkLtLj+AiHxwO7krL/W8VcJqnTJVGBUMZbFVIHaz5ao6t2zKmCJHlghHA1Ppl9XgbKsvYsg0+IYvx1r4i+/QM3Gxl3n1lRCWRsjwWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBC4NWHgeGQWLe4wO04CzGbRwYRK4NR5MKoRaPnJYA8=;
 b=CMJVysaNPP53+JgpTf7UPfqES83xbwGcoleYV0exlg+wb0uJvoX3eDWIawKX0CtMoh/C7ura5BPDISYQMoQJvoujVxOQyPAdkf41Im69rerUvduvsEoSafkGkkQ79qv5Gpp9mQmLbvFNrCgrLbqKx/8l1cBLjyLMGMZcmVnEz9w=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1744.namprd22.prod.outlook.com (10.164.206.162) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 21:17:16 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c%10]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 21:17:16 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     YueHaibing <yuehaibing@huawei.com>
CC:     "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "malat@debian.org" <malat@debian.org>,
        Paul Burton <pburton@wavecomp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] irqchip/irq-ingenic-tcu: Fix COMPILE_TEST building
Thread-Topic: [PATCH] irqchip/irq-ingenic-tcu: Fix COMPILE_TEST building
Thread-Index: AQHVVtN6kVAlZDOvh0+zCDkYCGqdNw==
Date:   Mon, 19 Aug 2019 21:17:16 +0000
Message-ID: <MWHPR2201MB127774E2D45194657F876CC4C1A80@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190813015602.30576-1-yuehaibing@huawei.com>
In-Reply-To: <20190813015602.30576-1-yuehaibing@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0141.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::33) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2a02:c7f:5e65:9900:8519:dc48:d16b:70fc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76525251-43bb-4c3d-7512-08d724ea9c80
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1744;
x-ms-traffictypediagnostic: MWHPR2201MB1744:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB174448D82A6B1BBD32559F0DC1A80@MWHPR2201MB1744.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(346002)(396003)(366004)(39840400004)(199004)(189003)(7736002)(6916009)(256004)(102836004)(446003)(76176011)(71200400001)(8936002)(66946007)(64756008)(66556008)(8676002)(9686003)(186003)(52116002)(11346002)(6306002)(7696005)(966005)(4326008)(6246003)(6506007)(55016002)(46003)(486006)(99286004)(14454004)(5660300002)(71190400001)(386003)(6116002)(52536014)(53936002)(229853002)(305945005)(74316002)(44832011)(478600001)(2906002)(42882007)(66446008)(66476007)(6436002)(316002)(81156014)(54906003)(476003)(25786009)(81166006)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1744;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DIMci3XZAA40O4VQAC7aMxV/gC9v4r7DNYZqwyn3DX/yDrODpZeH3tazjBd4Knsy0osjkWniamq4QQQf/fbDI+CzFR2Y9y2rGIp1VVuOAMiJyG2r0vspMpVnx3sFm5iAkvq29ZAbmDc2TFe1pDLSosM86SV6S8My1hoBBa/V760PTO3h0QdbQQNqDsfCGgi9wMGl16H5xBw0AdDbI8yDgqP7DSwJeQe4IWk0xk//ttS1YiiW3KQ8umffMh0ftXNy6/0Vd4hc7O3NsFrmTdgpAe/8a1H3d4MwQGjg64pdiEJhYMYYzV1oItlkBKtj74MJP6juFsKO0aHFMMrQlfQuzBgSDGCmAs/DQ9jcgi5GNL5YSk4jHKiMR73zYPm0JKBXt1/4l4meH++eNUFWWstTD0qmyRFTlmw8vSsjBBZFM4w=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76525251-43bb-4c3d-7512-08d724ea9c80
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 21:17:16.6394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t7ibfZhiVp0rIPucd+D6kL6pbRj3RB14q+VkkGNTjDNbytKmk4qluwfTBuaCs0Nnm0AYd74e9YxgZJQ3aIizkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1744
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

YueHaibing wrote:
> While do COMPILE_TEST building, if GENERIC_IRQ_CHIP is
> not selected, it fails:
>=20
> drivers/irqchip/irq-ingenic-tcu.o: In function `ingenic_tcu_intc_cascade'=
:
> irq-ingenic-tcu.c:(.text+0x13f): undefined reference to `irq_get_domain_g=
eneric_chip'
> drivers/irqchip/irq-ingenic-tcu.o: In function `ingenic_tcu_irq_init':
> irq-ingenic-tcu.c:(.init.text+0x97): undefined reference to `irq_generic_=
chip_ops'
> irq-ingenic-tcu.c:(.init.text+0xdd): undefined reference to `__irq_alloc_=
domain_generic_chips'
> irq-ingenic-tcu.c:(.init.text+0x10b): undefined reference to `irq_get_dom=
ain_generic_chip'
>=20
> select GENERIC_IRQ_CHIP to fix this.

Applied to mips-next.

> commit 8084499bd7d4
> https://git.kernel.org/mips/c/8084499bd7d4
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 9536eba03ec7 ("irqchip: Add irq-ingenic-tcu driver")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Acked-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

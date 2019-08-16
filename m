Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 372C49096A
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2019 22:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727641AbfHPUTG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Aug 2019 16:19:06 -0400
Received: from mail-eopbgr740102.outbound.protection.outlook.com ([40.107.74.102]:26649
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727545AbfHPUTF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 16 Aug 2019 16:19:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6UV1++ZR2YaWuuHQXT4vBUTDm8dYgQCCqXCkBfDa/bqkMJokH1OjqRX4OguYJT3NTf4yQYauVTpwvrUvoAKXjPM0gLn+QGku/8O/L+yP7n47o4+5AN3amFVOGMiLLsJkLGW7VUm4ttVtTt0KNykJLB2y3JwnFJ+B/gMm/AMeJ/MsBmpTjBTLF9WGIqyXiJLCCxtTlHaE1YNmSNxZIG4zc5UmSfL4SRm/RuSiIuMVedjI2vzyFe52EBcQu1Ne+1epNmCyTgta97EhYZsly0eHYPONhjx48U4qUScxeGBDyb/AMF6jcc4a9XGIU3ulfFlUKYCr6WeZg92UNaGFRtNqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFesdq79pwwa6qJ/WNIMauYBO+D//nyD2a3OkNYEUVI=;
 b=FQQnSa1apq3LCmFRK/20cupGjvu+oIs/a1CguPQSzQq1k9AlI2kKhZg60F8svQ/w4pePElsRstvFn0cndqDsWowubnJsJnKhVpkiV6Xl/Fv/abSNKGyqQen4cEUCVmhuIx9pt3RI//Z0epA0zYvbiB35SRT4ecYDuyMO18q6nz6NZTh+T/6EJ0r4M1Zwm5jOgh0acGI0RpgT3CCqfPojuqfGeEovKTzb7WQZu5tu0NSTX37cRAyQunUw7FCbWq8kdlQuKMMKW07oyZAYKyDPwTg6ASsPT7jJ6ANt70SlWto+fhkohR0YgX1G0FtHL+c6NhRtkmltPyUiB+JfqTcAXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFesdq79pwwa6qJ/WNIMauYBO+D//nyD2a3OkNYEUVI=;
 b=WuvblQ5t6u/PCdXoTyKBiC9w+1bPnF9pnvEUX7l2NXNM6EkgdZIgsW46O7acNo1A3bOTqf6RHszZOIddAATklUNC/FUSMs5V2exgs8kdNxcs+1lMn2qwyX2OEUKmain6nPuGjJ/JoQeZvZkhFG7TLFMwbNG9EyxPSGrheAgumu8=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1486.namprd22.prod.outlook.com (10.174.170.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Fri, 16 Aug 2019 20:19:02 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f566:bf1f:dcd:862c%10]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 20:19:02 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Thomas Gleixner <tglx@linutronix.de>
CC:     YueHaibing <yuehaibing@huawei.com>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "malat@debian.org" <malat@debian.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] irqchip/irq-ingenic-tcu: Fix COMPILE_TEST building
Thread-Topic: [PATCH] irqchip/irq-ingenic-tcu: Fix COMPILE_TEST building
Thread-Index: AQHVVG/YNAEDnEE/XUChmtFF11fMGA==
Date:   Fri, 16 Aug 2019 20:19:02 +0000
Message-ID: <20190816201857.46hqlsezqkxdabd7@pburton-laptop>
References: <20190813015602.30576-1-yuehaibing@huawei.com>
 <alpine.DEB.2.21.1908161428001.8238@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1908161428001.8238@nanos.tec.linutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::14) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2a02:c7f:5e65:9900:4e8f:fd55:165f:4d31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 86aa0df0-9d1c-4523-702e-08d72286fa6c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1486;
x-ms-traffictypediagnostic: MWHPR2201MB1486:
x-microsoft-antispam-prvs: <MWHPR2201MB1486AF389675AC2FC8CE7E00C1AF0@MWHPR2201MB1486.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(39840400004)(396003)(366004)(136003)(376002)(346002)(199004)(189003)(2906002)(186003)(25786009)(76176011)(386003)(81166006)(6506007)(81156014)(6512007)(9686003)(7736002)(305945005)(102836004)(229853002)(6486002)(6116002)(71200400001)(6916009)(71190400001)(256004)(42882007)(46003)(478600001)(11346002)(446003)(66946007)(64756008)(476003)(66446008)(66556008)(8676002)(6436002)(52116002)(66476007)(44832011)(53936002)(6246003)(8936002)(33716001)(486006)(99286004)(54906003)(5660300002)(14454004)(1076003)(4326008)(58126008)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1486;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wRM73jSO+Gv0NJHGJ81TTfI6tT3QS8g7jRBJJ0TxvGFWwP8pGXVM6UScqB+x5JtKwXKMxlp8IYwhsvfl0LbXIAPcPjJhTw2o4/q4YiJSW438lfq/5aCr+6aDKtftFqfd37qbLQCVIBlxlj1YKdlzUpvm+afRC5stGpFHRRcNepkUP0sL9ayXbO1QvFRIOVHKFJQf1Ltiopuw1PKOQQSem9XVGwDCF06epcRI9XAxEN4X9LI0SmczzSNKhYr2dPwhM/s0K2cuKBouHez/DTMgO0bO8g4kzk90zBY7G3+nOc8wBMOH64ZRRUeGyHIRiKiKh8nR1omTBUDCX0a3MFDZlpCpowXHXnD2C3FSZXbQHBzoThFZ55NgnTMeRFkEkzf3/7dEKH4zauwYs/bW1w79yKQ41MwrOJaRjHhPm1vu/dM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9A0A32E8C4931949A14EA2BC8F43835A@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86aa0df0-9d1c-4523-702e-08d72286fa6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 20:19:02.1545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /WI1JonFylFgexHmPCTbaeUltxwkptsn2/Y159VNAlZZhdHqwCGHOhhusuPwrb0WfRmfrZiOEBHiiwObrKWJsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1486
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Fri, Aug 16, 2019 at 02:28:42PM +0200, Thomas Gleixner wrote:
> On Tue, 13 Aug 2019, YueHaibing wrote:
>=20
> > While do COMPILE_TEST building, if GENERIC_IRQ_CHIP is
> > not selected, it fails:
> >=20
> > drivers/irqchip/irq-ingenic-tcu.o: In function `ingenic_tcu_intc_cascad=
e':
> > irq-ingenic-tcu.c:(.text+0x13f): undefined reference to `irq_get_domain=
_generic_chip'
> > drivers/irqchip/irq-ingenic-tcu.o: In function `ingenic_tcu_irq_init':
> > irq-ingenic-tcu.c:(.init.text+0x97): undefined reference to `irq_generi=
c_chip_ops'
> > irq-ingenic-tcu.c:(.init.text+0xdd): undefined reference to `__irq_allo=
c_domain_generic_chips'
> > irq-ingenic-tcu.c:(.init.text+0x10b): undefined reference to `irq_get_d=
omain_generic_chip'
> >=20
> > select GENERIC_IRQ_CHIP to fix this.
> >=20
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Fixes: 9536eba03ec7 ("irqchip: Add irq-ingenic-tcu driver")
>=20
> git show 9536eba03ec7
>=20
> fatal: ambiguous argument '9536eba03ec7': unknown revision or path not in
>        the working tree.

The referenced patch is in mips-next - can I get your Ack to apply this
there too?

Thanks,
    Paul

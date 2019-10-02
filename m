Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A978C947B
	for <lists+linux-mips@lfdr.de>; Thu,  3 Oct 2019 00:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbfJBWyB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 18:54:01 -0400
Received: from mail-eopbgr820092.outbound.protection.outlook.com ([40.107.82.92]:52531
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727103AbfJBWyB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Oct 2019 18:54:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHciOKE7l4NM1zthu8+JR3hd4aLjv40itGo4qyUZjoIzfTqoVVwpoZknnnnM807zpaCdnsSUN9k9pI418QtkEsZT3JXu7KnPP1BaDuslegN5r1WJDT3pTFSRXIRwWDM12xaJXLtvl7Eupq8JetBH3WPGplq6kzzli1bLuv1lBNDA2OQZKMX4uxeL7Bk7AZgU6NCd2RoOSs1CZhFZ+V7MK+x6teyRnGQ9G65EiS05TgnY6iQaEMbSgWLXidU7r/T4p7SQCkgWH9vrPxjf7bJElQp+RLoru4mYcR2hwRafAt6ptwYfwru+yF4LnrkAEORgRNF4GEFjjFRadSag17f7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ian0Zfs0J6GyFVDLDOjY6iDdvlqPagATymXn4JZ7VAE=;
 b=ODyvwCm5YoEjLvHAwooRl2eKTdLGW6mh3zdmg+8fkplRCsnS5jBAI69/+ks3PKsshxHEjN83UJjTGdjAcHKfbJyqh7eboHaZrUtDSssZQsHgFA8br7ZfGmwyf6MYS0rAW9kIHwDlHS+MUqpkVx72WV2LaGPixxoeGijYjSJkuQMhkMVdmrry94wnn1eIrtxa/M4hCZDuKNdZhry5a+5v3loBklPvxQf+EPErpoOV70yJSGzBNBWBxjFktmDbmxuSHvuIrTS/zD6b4Ewjf1ZAkTOKUaBH+Wt8M7yugQ/fq3xD6FNaFXa9vSaMfkNu8pcf240oVEO7DDRA3iD54t/BJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ian0Zfs0J6GyFVDLDOjY6iDdvlqPagATymXn4JZ7VAE=;
 b=YBMAYh3NA+P/59wysbMAw+tSHPTWVlE4aE2sn8NR1dFlfAFpf7qsifN2pEst9Fur8XFS0s4ivG7cRffj7fyFtowFMzw0l1mACl39KxO72gJs+R5vmOdFhFjmi+Fhe9Qdn5XpCJ261H1Z4Cq7y2NZ9SzqMBwkeWsEwFy3KkAr3mE=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1294.namprd22.prod.outlook.com (10.172.60.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 22:53:59 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.023; Wed, 2 Oct 2019
 22:53:59 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: init: Fix reservation of memory between PHYS_OFFSET
 and  mem start
Thread-Topic: [PATCH] MIPS: init: Fix reservation of memory between
 PHYS_OFFSET and  mem start
Thread-Index: AQHVeXRGEnUUPWwIDUuaPQg5R7jkYg==
Date:   Wed, 2 Oct 2019 22:53:58 +0000
Message-ID: <MWHPR2201MB127731DF0BC99BCCA4D02680C19C0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190924151956.9528-1-tbogendoerfer@suse.de>
In-Reply-To: <20190924151956.9528-1-tbogendoerfer@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0049.namprd02.prod.outlook.com
 (2603:10b6:a03:54::26) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12fd4274-aaad-4a04-f84a-08d7478b6937
x-ms-traffictypediagnostic: MWHPR2201MB1294:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB12940F87389994864E28F63AC19C0@MWHPR2201MB1294.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0178184651
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39840400004)(136003)(346002)(366004)(376002)(396003)(189003)(199004)(256004)(55016002)(478600001)(26005)(6916009)(6436002)(186003)(316002)(74316002)(14454004)(4744005)(305945005)(54906003)(25786009)(7736002)(99286004)(4326008)(6306002)(52116002)(76176011)(6506007)(386003)(102836004)(486006)(476003)(42882007)(8936002)(446003)(966005)(33656002)(8676002)(11346002)(81156014)(81166006)(66946007)(66476007)(66556008)(64756008)(66446008)(5660300002)(66066001)(2906002)(6246003)(6116002)(3846002)(44832011)(71200400001)(71190400001)(52536014)(229853002)(9686003)(7696005);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1294;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +DPimu/T4BdPmK0ntYdWS4pZTaMIJMmGiuR3zcXW6oBtRTyWCf0a8EZjNyB2aKBeXjz7KZ9yyUa/Hv8wIgPvGdlFaaaM3D8X6VtUWV/iJ4TLBTnu1ar9WqeU3nb3eX4k4AQPll3JTl/r0l+F8p/Ap7SH2ZZ/Y3My5hbN0GZ9JyyS+WAnhR8U+ZpVlZherJIr1KcnrZ/rPYBAUMXBTggHGXioy3XMq5ej0alV+ldt3dYklxwm6rCq4OTa4RGA8SbDrghb9CvW6agZHdvZab/KXXcMhc4klF9l/W4FF4o2K9AR2iBsMnLCkvkKtpZdnHMST3tJIpUUwKg5saWqenyj3kVQ2exU8ajKudNH0hqzHjQPJ059hOvKbHNEwFBRNpjrTrSkToH9s67xQEFhVrAsPd2UXdLicWJXuRiED7JgL3SCc4iw364jE3xLUXVEmY2FNu55ZyIrVjj0dwIQtxligA==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12fd4274-aaad-4a04-f84a-08d7478b6937
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2019 22:53:58.9475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 07eUL9HJq6STMcWHWVDFMNiu/iERXEkLYxs9QVkMXrf72SY0J/K2rgMdISXqeYSbkOJJTN4qIa5FQ1cCy5/Ngg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1294
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Thomas Bogendoerfer wrote:
> Fix calculation of the size for reserving memory between PHYS_OFFSET
> and real memory start.

Applied to mips-fixes.

> commit 66b416ee41ed
> https://git.kernel.org/mips/c/66b416ee41ed
>=20
> Fixes: a94e4f24ec83 ("MIPS: init: Drop boot_mem_map")
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

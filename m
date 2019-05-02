Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66A5A11079
	for <lists+linux-mips@lfdr.de>; Thu,  2 May 2019 02:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbfEBAIH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 May 2019 20:08:07 -0400
Received: from mail-eopbgr750127.outbound.protection.outlook.com ([40.107.75.127]:19206
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726126AbfEBAIG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 1 May 2019 20:08:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLSfH8x/RaKbCYJMKJuh0gz6DmjqQInRzKBgH/uBHBM=;
 b=dKxbxnvgBVggLQBhJpQGzKQuZPbPwQw+XbSrH53K9rZv90frfbyOh1N4mUrIthgE2J7RoTELnrmhD7SlumAM/XguoU3ZXBrVG0lvasOQPlb6tmsx8++ZO7FQJbdhiy4Fq4kf9lNc5TaiRnzuYIjOXGGAa5k1aK+r1E94VzPuC2E=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1375.namprd22.prod.outlook.com (10.174.160.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.14; Thu, 2 May 2019 00:08:01 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765%7]) with mapi id 15.20.1835.018; Thu, 2 May 2019
 00:08:01 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Christoph Hellwig <hch@lst.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Ley Foon Tan <lftan@altera.com>,
        Michal Simek <monstr@monstr.eu>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH 4/7] dma-direct: provide generic support for uncached
 kernel segments
Thread-Topic: [PATCH 4/7] dma-direct: provide generic support for uncached
 kernel segments
Thread-Index: AQHU/0QKKKiJlPSrw0CLkNp0FmAaxqZWhWOAgAAC3QCAAAMrgIAAAmOAgABp3gA=
Date:   Thu, 2 May 2019 00:08:01 +0000
Message-ID: <20190502000759.4ii2wuogc6fuc3jh@pburton-laptop>
References: <20190430110032.25301-1-hch@lst.de>
 <20190430110032.25301-5-hch@lst.de>
 <20190501171857.chfxqntvm6r4xrr4@pburton-laptop>
 <20190501172912.GA19375@lst.de>
 <20190501174033.6rj5aiopdeo4uqpw@pburton-laptop>
 <20190501174905.GA20458@lst.de>
In-Reply-To: <20190501174905.GA20458@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b504cc96-7aff-4810-be5c-08d6ce923d64
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1375;
x-ms-traffictypediagnostic: MWHPR2201MB1375:
x-microsoft-antispam-prvs: <MWHPR2201MB137538ADE64992C9B0DF2EBEC1340@MWHPR2201MB1375.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(7916004)(39840400004)(136003)(346002)(366004)(376002)(396003)(199004)(189003)(52116002)(53936002)(478600001)(8936002)(486006)(3846002)(229853002)(66066001)(256004)(66446008)(6116002)(305945005)(4744005)(44832011)(6512007)(6486002)(9686003)(1076003)(7416002)(58126008)(6436002)(446003)(11346002)(25786009)(66556008)(6916009)(42882007)(6246003)(66946007)(476003)(7736002)(73956011)(4326008)(64756008)(81156014)(81166006)(386003)(71200400001)(71190400001)(5660300002)(8676002)(102836004)(6506007)(76176011)(316002)(66476007)(99286004)(33716001)(14454004)(186003)(68736007)(26005)(54906003)(2906002)(41533002)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1375;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7e9f1kF25wdsNQ9/CuQt2ehBF+d6+QmjUTC33TqugsnTLOsifqJZxCUlWe/KCplZvVZzfFYohCwtBrLFRSzcUNU0VLhQrUOIRdaFZZn1wc9/aqqNKkCreOBjVfcSxOjtKbyuyTMkSXyTiK4SHi9Cu/MFUXSaOlr8WRe7mNzLz94gBbhRhE1E8gudNcz0ZmlqQfoJfMN1uohm3M4WTCXrdTIyD1OM7Hj7DgWykgr1A8+6pC1aePwkXlNPO90hTBO7li9iOrEqlzC50Idd/2Ce/S4q3h+K5/Ww0HrD2Eop/ody3xmLCgTLY8llzw1KwU+TIGoStj5Mdp7bQqEbiQqr1ng08Jtp31vngBwXojmtmMpRIo1nKn11/xOeG/NsTZ0dodjUqDBimH3M24kXXMQsJ9xu45cMTIHg3hm7Iu9mIJY=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C63A3FF604C2164B8DDA0238C881F03D@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b504cc96-7aff-4810-be5c-08d6ce923d64
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 00:08:01.3216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1375
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Christoph,

On Wed, May 01, 2019 at 07:49:05PM +0200, Christoph Hellwig wrote:
> On Wed, May 01, 2019 at 05:40:34PM +0000, Paul Burton wrote:
> > > > If it is necessary then as-is this code will clear the allocated me=
mory
> > > > using uncached writes which will be pretty slow. It would be much m=
ore
> > > > efficient to perform the memset before arch_dma_prep_coherent() & b=
efore
> > > > converting ret to an uncached address.
> > >=20
> > > Yes, we could do that.
> >=20
> > Great; using cached writes would match the existing MIPS behavior.
>=20
> Can you test the stack with the two updated patches and ack them if
> they are fine?  That would allow getting at least the infrastructure
> and mips in for this merge window.

Did you send a v2 of this patch?

If so it hasn't showed up in my inbox, nor on the linux-mips archive on
lore.kernel.org.

Thanks,
    Paul

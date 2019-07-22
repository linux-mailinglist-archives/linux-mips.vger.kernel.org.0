Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9086E70B16
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2019 23:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730286AbfGVVPH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 17:15:07 -0400
Received: from mail-eopbgr730127.outbound.protection.outlook.com ([40.107.73.127]:20449
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729697AbfGVVPH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 17:15:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PC70U+D3AvB0tsR+pvhajFY554b41l9jgdFytPC9eBuhiRvL//MavZafqu9udovZ0UgSqFuS11JUfhQSB4gh4/IbZ5Yyd0uHBuKlC2bF0HNaaqoTs3dunzpd5/m8Mjz8zc9VAxMtbHCQZB2QEjfIBkIa7Ig77Pt7R9+PfLdOgJmRiFtxDbAtBIJbaRykFAaQ1EgL5yMoPIZVhzutfS1refaxZA0E5trr8lEVdHQCtPaGDGxkZcxVJlBlDa+2ud68sHoPPLBuXYYGaYD7+NPnRTdoLIZe2+LKzx6mpvoRWRaERibbseUYUEMuDQz/Poiiw/bflwi0q9E2tgJYt/0v8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DPHMuDnu6/d+xKZ5QJn2klAHKO59Gg8KDjUav5RZFQ=;
 b=jSLTLmZY0G+JZgOLddAXcNhXKIF4bSPMFkZJbjbIy+ahIxtw7OfbeVdz1G0JcIHOb76LKibXdiB4VS+OFeV4pf3zwS0smHdIILyG0DgfxuM+svgqbTF10PF2gx0SupQx4mFFZRciXTh3gIDtK80Td2rz5ozlIcLvALypvGk3gIzufYKAbzudrNHC/MEtP5E/ea4yugBgW6xNae6uTRJ+N6HlVWyDVj4+JbMlS7Cl2+h5zqE0wrO7XShE1IvcbI+1Rp5sXQetWlr6VMT9SAyKQM8knUC3JMk+x1/CaaLElHcUbJrH41uMxjJy7E/zEprOEarmn/UNnrZeuvkyVuCp8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DPHMuDnu6/d+xKZ5QJn2klAHKO59Gg8KDjUav5RZFQ=;
 b=L/RX1xJexv5TERPLz/sXEgCKZVOnRMyI8LnrkHBtE5KnUgp5wSJmSMQNU+IifUdpb7HmhHlAwX1VhivVjuvglmlxq/p+oEf6eskBx1IzF4K6lPvKyHdfTr/EPtNqUwI2Cfn2rdt94WZRwx9ZYQvdOCuIW/HClRd4Kgd/8sFuj4w=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1757.namprd22.prod.outlook.com (10.164.133.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Mon, 22 Jul 2019 21:15:04 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 21:15:04 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>, "od@zcrc.me" <od@zcrc.me>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Daniel Silsby <dansilsby@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 1/5] MIPS: Disallow CPU_SUPPORTS_HUGEPAGES for XPA,EVA
Thread-Topic: [PATCH 1/5] MIPS: Disallow CPU_SUPPORTS_HUGEPAGES for XPA,EVA
Thread-Index: AQHVO1XklYg6ML4/zEqYJ0ENYICeCabXLmEA
Date:   Mon, 22 Jul 2019 21:15:04 +0000
Message-ID: <MWHPR2201MB1277F0963449C85EE94A4E09C1C40@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190715214003.9714-1-paul@crapouillou.net>
In-Reply-To: <20190715214003.9714-1-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:a03:40::28) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d50030b7-9a9f-4b95-dc11-08d70ee9aa51
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1757;
x-ms-traffictypediagnostic: MWHPR2201MB1757:
x-microsoft-antispam-prvs: <MWHPR2201MB1757B9B1585018F92225A771C1C40@MWHPR2201MB1757.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(346002)(376002)(366004)(39840400004)(396003)(199004)(189003)(8936002)(2906002)(81166006)(52116002)(71190400001)(256004)(99286004)(71200400001)(81156014)(186003)(68736007)(4326008)(26005)(6246003)(478600001)(102836004)(6506007)(76176011)(229853002)(33656002)(7696005)(386003)(44832011)(446003)(11346002)(486006)(53936002)(42882007)(54906003)(316002)(55016002)(5660300002)(52536014)(14454004)(25786009)(66066001)(6436002)(3846002)(66476007)(66446008)(66556008)(4744005)(6116002)(66946007)(64756008)(305945005)(74316002)(7736002)(476003)(9686003)(6916009)(8676002)(142933001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1757;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fo3JPdTd5Nq1p0WZXb4R/EGQ41IaNzikFQGldLHjE1YkM4I34wP6HEkaFUOCHzwZbHt8cpmDB9Desb+Xt2fVTKt83Of7KuseI3w1BCIFtQzWpXfTuyp96ZuQ1p+l+7dPgZyld8k0Mtf5WAr4T4OmUwnL5dap8dErRsov3RNTaIpdj4Vv7enV6REor0oai0Mh1Kv5HOP4Z3LfPIFT34bIVbONKYHQ3gCw69m1Eq1LVlHIdLH+asWmzjjW2xcSB4R9EIm+441zBjNka+vFRy8hH6SOUKyaMOffaoBfwZDYEZjQ0cK7vYRmtGbqn9IvogeI9pnC3g9cN1VhLgNEkpE4Ii5yYL2WBlYDoCMJiUdvWLW5ZQdlxxV07TR1AyXiuYQt8n8LuueivQbCIzZP7RfIds2REMacR6thTUYamclOvM8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d50030b7-9a9f-4b95-dc11-08d70ee9aa51
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 21:15:04.6637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1757
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Cercueil wrote:
> From: Daniel Silsby <dansilsby@gmail.com>
>=20
> In preparation for 32-bit MIPS huge page support.
>=20
> EVA,XPA are extended-addressing modes for 32-bit MIPS systems. Because
> huge pages aren't currently supported in 32-bit MIPS, this doesn't take
> any features away from EVA,XPA-enabled systems. However, the soon-to-
> come 32-bit MIPS huge page support doesn't yet support them.
>=20
> This also disables CPU_SUPPORTS_HUGEPAGES for the small number of 32-bit
> MIPS CPUs from Alchemy/Netlogic that support a custom 36-bit extended
> addressing. It's unknown if they even support huge pages in hardware.
>=20
> Signed-off-by: Daniel Silsby <dansilsby@gmail.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Series applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 084D170B35
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2019 23:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732586AbfGVVWH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jul 2019 17:22:07 -0400
Received: from mail-eopbgr730127.outbound.protection.outlook.com ([40.107.73.127]:38141
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732574AbfGVVWG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jul 2019 17:22:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bo+t8QY4lAFO57tHqU2jUQxgzqORDrffqM6iTEU/yF012wS90c9WjRjbO/ME2rbJJMF2xtLtTgPAjizZE9WX9WMsAfKN/zmhoGFxCwg8lT4h9NLfKfkRwgIAYu1YX9l0p2uvdHV4VI4B/lGU4SPVUXxK6GQ3cdNXajVxQkQVEI8A2uToqevFL2K7cXF3iPT/Er4O0ELkTnumHlloJ6eEsno24wWrLu4MkMFo1fgAw9gYfDRSgCKyLLq+Z8+5+shHyAWJiiQZtobfG6bFGCdSjTOUoEjPdir/eR4d7okwGdAugQzJWDBzJeh8vU1j7pd+8FKBcF/55jPwiHikc9GTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eP1F47k7v6w0gs5cw3weXd8Pf8jOX+jjksUNgU5Z/U4=;
 b=NwLQ1UvIFt06wTW5E6oYEuYg0QIrvWPdqZrsQlL6Xt5xhFDDHCItoZvSQIGVLpaiOoxfFZyy+GpbOUpcE3kxKFpP7ERITF4u9NdS/lxeXILrjL5asJwk1pcqu9Ea9045VMHolbqwJIe16npq5dB6vVa9RCHC5z3KE/wB2lYfDcwk547ZEZzBr5gWJOsjDFyjkQcF4RHd9N174Qh0uMe4WWlYTZpMoi29pSWBwkwLCMnBOBr5moYDSdEVVg38mwLr1JBGEIcl5K/ZeYWXDhlXy5M+AAHfnriFTw8we3yTYwsAAFE1RDWhaND5yEuzIIuKGd9Idf9coJDOCblvk9K0og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eP1F47k7v6w0gs5cw3weXd8Pf8jOX+jjksUNgU5Z/U4=;
 b=jPo3yttNDtKXogcz3x8OGb+8JDOGSucsnN5Uj7I1yJG0sJLDyigqQdRMqd0bXwgbnzV3XiYbewrOhokJJh+BmUJ4+9RJ1y9uDfbfqmcc5kxV6G0gzuer7aR4p9ZOcLDRXSTt+klFNqfd4PaE5FKZFvVgv1WwJmTheGgFAKsl2Js=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1757.namprd22.prod.outlook.com (10.164.133.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Mon, 22 Jul 2019 21:22:04 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::49d3:37f8:217:c83%6]) with mapi id 15.20.2094.017; Mon, 22 Jul 2019
 21:22:04 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 2/3] MIPS: DTS: jz4740: Add node for the MMC driver
Thread-Topic: [PATCH 2/3] MIPS: DTS: jz4740: Add node for the MMC driver
Thread-Index: AQHUtOntLO/EgPGbyEyjPeWfCtJvS6bYPS6A
Date:   Mon, 22 Jul 2019 21:22:04 +0000
Message-ID: <MWHPR2201MB127739803859CA9A3917CFD8C1C40@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190125200927.21045-2-paul@crapouillou.net>
In-Reply-To: <20190125200927.21045-2-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0057.namprd07.prod.outlook.com
 (2603:10b6:a03:60::34) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66a96d5d-fba6-49a2-f5e0-08d70eeaa48d
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1757;
x-ms-traffictypediagnostic: MWHPR2201MB1757:
x-microsoft-antispam-prvs: <MWHPR2201MB17574E3380C3EB51B44CD1E9C1C40@MWHPR2201MB1757.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(39850400004)(346002)(136003)(366004)(199004)(189003)(66446008)(66476007)(3846002)(6116002)(66556008)(66066001)(6436002)(64756008)(66946007)(52536014)(25786009)(14454004)(558084003)(476003)(7416002)(8676002)(6916009)(9686003)(305945005)(74316002)(7736002)(99286004)(71190400001)(52116002)(256004)(71200400001)(4326008)(6246003)(26005)(81156014)(68736007)(186003)(8936002)(81166006)(2906002)(478600001)(486006)(11346002)(446003)(5660300002)(55016002)(53936002)(316002)(54906003)(42882007)(33656002)(386003)(7696005)(6506007)(102836004)(76176011)(229853002)(44832011);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1757;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: btNdvlVYU5FXLy4+jBlOPIZsrb+AHblqkssVtOH26S49aiTvQDBIb1rZIBMcmHT4CLUiNbFUEQ8Z6tiyUR3+FMFVnZBxvpOxV+4EtqUZJMJ17fT0X8xXF8rDyIJxip+ZzR6sLkGDxwnXD3nAZySjjldIYFlar4iXTmyOarHwx1SF8nOBMna54T4N13dtOMogKjPsDnOCwfdwm3GzMg/3YOn2mgokdVNa2Y04j1Rr1yfVIe0gtVTs0ausDyFomYMOygNu4xRs5npGI7oocYDlYnOcnvQQuoyf+QYlO3oH9TbaIp8LbIDN1tp5oWAxVqjaWq18HsFZmikYU0PA5qyGNOJwvQKSbCkS0FfifV66TSqCuwMPywOSE0jRn5qlyaDDMcOptD8xAh2opZWogXGjZB5y+po/C1wHuFc8OilbWMA=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66a96d5d-fba6-49a2-f5e0-08d70eeaa48d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 21:22:04.6391
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
> Add a devicetree node for the jz4740-mmc driver.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

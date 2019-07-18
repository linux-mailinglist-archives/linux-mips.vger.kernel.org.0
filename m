Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA9636D607
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jul 2019 22:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727767AbfGRUwe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Jul 2019 16:52:34 -0400
Received: from mail-eopbgr770118.outbound.protection.outlook.com ([40.107.77.118]:31246
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727762AbfGRUwe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 18 Jul 2019 16:52:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJ5Z+5+umm82IrX9dJ1eiLQkbqwslNJIj+s0s6dhR6UizPF+BHdEPYDbpq3poCni7gbnOBE4Irdh+lUX0vCg1QxvIj+Z52/jc6g6IBvfVUCQosv7NbAjpH8c9NHtaNz/aUMDByvpm1hXezVTsc7AbcQ/Xab9FuKwO5qf1/3OIKHZ5iwrNrYHsK6F00c55uqEpHl+SVtw+Xp7mCa68+Y5nGoRI9mdXexCykgM+cshz2sU9Na1KRENN9i0aPQVdxN8vCHJpwGoI33VUabzBzBRp4OfKQuXqulzzKrLRFGkzdqtpGpG4fKJffe/4gY4KpnjwNXgXi3oGXXSPpw2Og2RSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWXk/qZkB6ZAIn/oJbFZgQfMYMSNkKnbJi1eIscb/qQ=;
 b=L3PlVHG2yego5OjCafY2y4cruwXCOqXhbZd22FPAkNFyO54+/NyZrKMJqTCRUaB4B+ViPnnKx2qs12mH0ODzZHpi2yjr+8CRpwApUsX2KU7Xk0dCt8vC5uuOXn3CvWAeVhyeG7ppI/b79yEWoNrWp7pI47LzOmCwPYwld8eky23AHu1Rjb7YVck7yFP6aooUVCACeyywVGEXXBUe4EUx59yNp9UYXWmbaW9/9rXHscx480xIrkDyWEPjy1cXcB8sHN17WUZzyGPwGGa65CoQ9VApO0GUA0LWaBglBqhmKhZ2m0xu9uRgm3AnhBWT61/FmUDZg8wFQRnWjMWgnd6pWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWXk/qZkB6ZAIn/oJbFZgQfMYMSNkKnbJi1eIscb/qQ=;
 b=IqE6/lLgmTRQHbqv/HMckKwq5/YydZs6ZMnzo//CtqTxBrKYDDvPA0pt+BFEdAy6HBDEswV05Q5NGUFoYxASYBmrwui8l/m4Nw/JFA8UtL0GLxI4v3eha6m4O4K7GDwfmyPV9+xvhRm1AfUyg6oNIijA9HkYc5oAzDHiQMX+QxE=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1568.namprd22.prod.outlook.com (10.172.63.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 20:52:31 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::746d:883d:31:522e%5]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 20:52:31 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Annotate fall-through in kvm/emulate.c
Thread-Topic: [PATCH] MIPS: Annotate fall-through in kvm/emulate.c
Thread-Index: AQHVPNi0ApY7UI34VEGA1VC3MClUF6bQ27uA
Date:   Thu, 18 Jul 2019 20:52:31 +0000
Message-ID: <MWHPR2201MB12774B810DFF1C36AD1E8261C1C80@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190717194900.30143-1-paul.burton@mips.com>
In-Reply-To: <20190717194900.30143-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0062.namprd05.prod.outlook.com
 (2603:10b6:a03:74::39) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bae5824d-893f-4e6c-d5ec-08d70bc1d9d6
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1568;
x-ms-traffictypediagnostic: MWHPR2201MB1568:
x-microsoft-antispam-prvs: <MWHPR2201MB1568CEF23D4671B656CEE6D2C1C80@MWHPR2201MB1568.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(346002)(396003)(136003)(366004)(39840400004)(376002)(199004)(189003)(68736007)(53936002)(54906003)(33656002)(186003)(229853002)(102836004)(99286004)(316002)(9686003)(26005)(446003)(11346002)(476003)(55016002)(42882007)(305945005)(76176011)(386003)(6506007)(7696005)(52116002)(486006)(44832011)(66066001)(7736002)(5660300002)(8936002)(66476007)(52536014)(71200400001)(71190400001)(8676002)(74316002)(6436002)(4744005)(478600001)(2906002)(6246003)(256004)(4326008)(66946007)(6116002)(3846002)(6862004)(81156014)(81166006)(25786009)(66556008)(66446008)(64756008)(14454004)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1568;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XtgD4zaFxsOg0VfIVoeeDbjzj9PrZry82MozSPzYqsYIWHUc/RaJ0r7BVJ16pRdb8jwpq6nglx7U0nBv2pGy4g/BCp/an+T3lDNTBpA63k2UZ/nLIyrxqVavL7/QuSu0VqNCr/PgNBmncoQTuHUdnWwD9OBBnuhYlDmanArAX8SEoUJUq9xTTZUDcKoNuz5FSbjaNJnQaOxlfabwNxjw8l2S/jy5musGBJzrcRiu7IVuOyQOcqtVwrznGi2zoZ6glu6YuJ3WTMcxtB12h88ewMW2XpK3dlRBHu3rWVKdzoTObA+nZCiMuMIpjvGEQ3P84F28UYzJGo/9G2rh9uMcUDUXHNgsMIAdUY0ILhIavVPiUvCEtzKwnV5kmF6aGIoaRTDa0ILw8zPUHwm6oNV02i+Nup1GsrPTW49yR1KE0bw=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae5824d-893f-4e6c-d5ec-08d70bc1d9d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 20:52:31.2507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1568
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> kvm_compute_return_epc contains a switch statement with an intentional
> fall-through from a case handling jal (jump and link) instructions to
> one handling j (jump) instructions. With -Wimplicit-fallthrough this
> triggers a compile error (due to -Werror being enabled for arch/mips).
>=20
> This can be reproduced using malta_kvm_defconfig.
>=20
> Fix this by annotating the intentional fall-through.
>=20
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Applied to mips-fixes.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]

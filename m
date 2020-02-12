Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09A6B15B37C
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2020 23:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727692AbgBLWSm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Feb 2020 17:18:42 -0500
Received: from dispatch1-eu1.ppe-hosted.com ([185.132.181.6]:9856 "EHLO
        dispatch1-eu1.ppe-hosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727564AbgBLWSm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 12 Feb 2020 17:18:42 -0500
X-Greylist: delayed 595 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Feb 2020 17:18:39 EST
Received: from dispatch1-eu1.ppe-hosted.com (localhost.localdomain [127.0.0.1])
        by dispatch1-eu1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 4FEC030118D;
        Wed, 12 Feb 2020 22:08:45 +0000 (UTC)
X-Virus-Scanned: Proofpoint Essentials engine
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1-eu1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id E338AB80069;
        Wed, 12 Feb 2020 22:08:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z1IX59ZphssSUkQp6ycYiSBI5Mf9sZusDDw2q5w2rBu+T7VLeM9mm4pPmHTreJ31lbCU/c8+71VypQb/2ImlimkZMKM8aptubEF3oCQyEB777tHsO71S2O+taoRF3wW3Jf7LXVk9/Q5eFyvUvvfuenO5NhV6/mwq7n9TifLh/3KOXfKBrpEWr3dRenNRId1hmEf5m31ccLQ1BdqIMpHlV8/jgaBDZ7x08sBc9tABuqxZ6u6VQtuHLee088imQGXg/RN+2wBGD1njfl/3jV8cJSFtD9Gj1gdQgbtw5n8hNs7QvexW7Ut5cIa/eoLNk30v/OuQ6+H69xchu7TN4Bfn0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rSz+9QlnaRArNoTDgvcLcoC5V9xm+ygVI6Zjx0Ct7o=;
 b=fHM4/c/C5REhC4GqEJqPmADdO3Ig+sn7AVgaevtHm+AHoePEUc3AsYmF3MGwiNfQzN/E9nbypaJgZpfYAkCI8XEPM+FqL2Ud6sxwDCjoTPg8RD0lGxikA2Y/nchw1n+RePrc1LTRLsBctzRUPYXRSOinevBFaasiHE1hgy9QgSwk8eT1aiP6HLfNBe/pQxjBcXgIRRhO29ZCKBq6H677Nf8Ng1s+615dhisjGI68zHyM1nQHHudSnlI+NddnfQzYJkaXNi/Z51KU7S7kddoBsrdOgXpVgeaGjpKO99tULGXXmCu2xFLlUlroD8ArRLksdBnK3D7QLYGpXipPFtaUgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sondrel.com; dmarc=pass action=none header.from=sondrel.com;
 dkim=pass header.d=sondrel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sondrel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rSz+9QlnaRArNoTDgvcLcoC5V9xm+ygVI6Zjx0Ct7o=;
 b=p8T1L2kRi7+nnudEds6g2nu5CvsjJTVZGJJkZUkoQFteto8wGyyPJRo9wNcAG+bp8iL+Paw8p6kE+UBtyj7Ia/KqAKSVId+kRDGnX3/9GeNYl3tZmRMzbNkZpAt4xlg9xVxxJmWqaeKjfecn27QiYDnLEFgxHJAsT+Gim55Ixxo=
Received: from DB7P191MB0314.EURP191.PROD.OUTLOOK.COM (52.134.99.151) by
 DB7P191MB0347.EURP191.PROD.OUTLOOK.COM (52.134.100.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Wed, 12 Feb 2020 22:08:41 +0000
Received: from DB7P191MB0314.EURP191.PROD.OUTLOOK.COM
 ([fe80::f926:962:4e32:d5d]) by DB7P191MB0314.EURP191.PROD.OUTLOOK.COM
 ([fe80::f926:962:4e32:d5d%3]) with mapi id 15.20.2707.030; Wed, 12 Feb 2020
 22:08:41 +0000
Received: from [192.168.0.46] (82.14.193.49) by LO2P265CA0327.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a4::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend Transport; Wed, 12 Feb 2020 22:08:40 +0000
From:   James Hartley <james.hartley@sondrel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        John Crispin <john@phrozen.org>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/7] MIPS: Pistachio: Replace <linux/clk-provider.h> by
 <linux/of_clk.h>
Thread-Topic: [PATCH 6/7] MIPS: Pistachio: Replace <linux/clk-provider.h> by
 <linux/of_clk.h>
Thread-Index: AQHV4Y1n9SswgBWnjEe2OhWviFMu3qgYHrGA
Date:   Wed, 12 Feb 2020 22:08:41 +0000
Message-ID: <98747d93-dd49-a121-e68d-24bcf4477373@sondrel.com>
References: <20200212101544.8793-1-geert+renesas@glider.be>
 <20200212101544.8793-7-geert+renesas@glider.be>
In-Reply-To: <20200212101544.8793-7-geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.14.193.49]
x-clientproxiedby: LO2P265CA0327.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::27) To DB7P191MB0314.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:5:7::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=james.hartley@sondrel.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7455b3a8-4181-4994-86b5-08d7b0081e36
x-ms-traffictypediagnostic: DB7P191MB0347:
x-microsoft-antispam-prvs: <DB7P191MB0347D0B5EB9B5432D625EB8CF91B0@DB7P191MB0347.EURP191.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0311124FA9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(366004)(346002)(136003)(396003)(39840400004)(189003)(199004)(5660300002)(66476007)(66946007)(64756008)(66556008)(52116002)(66446008)(4744005)(316002)(16576012)(54906003)(110136005)(81156014)(81166006)(956004)(186003)(478600001)(8676002)(44832011)(8936002)(16526019)(53546011)(2616005)(26005)(6486002)(31696002)(7416002)(86362001)(31686004)(4326008)(71200400001)(2906002)(36756003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7P191MB0347;H:DB7P191MB0314.EURP191.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: sondrel.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w8KpzaD27tsX4/d5BDqmFONGAEf6NLF2WmGGYrNVdbz2sBzmFWoi79PCeRn5ut1by0MGLxDLSXq6exeVdwuGbL6lIkqo2oqzZyck9MePtCBvj5571BnTSwL1g5FTA8EJJsqcxKoIL/e51Bqyps0zHDkc/bJemXKmDI7HuI62GV/MBImIVhmpHfkEjGNPp+6HjR+rg8gW6apPMfT/p66bG65B5rGyCBwE5LRUtA8u+Fe8mRP74lveDC0/RIALxwH510HDvoY5uGWr85IJLVmMY5EaGe0S9phH4rUlDeohzSX6fVRnCKC19AcnAR6FbEiYoCvBnMKeVbvt//MXX/l+A7NL8+jiQAbVcLBYIZAb65AU+T3YIMht/7IoCyRqnOEGCyZDI0McROXH/kgUbckHN5eObKeyumclXl8nFusEN8flkMl630cdJ6DofnPpFkVq
x-ms-exchange-antispam-messagedata: On5zCajUTVRU99SZjQQ5WH0bqyjng56y6LWMyqUF6Hub48ZCsRqFTT7fE1KECbxn8fSrQ26SLDxIHy1HTBD9KUG27/UZYX/wkS7vWpeM0+UAFI4UPXXYWWchx4KmmDu1BDOlLFBgnVH6chjZTvXzFg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C67F26EA4497E04081197EAA7ADF0E5C@EURP191.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sondrel.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7455b3a8-4181-4994-86b5-08d7b0081e36
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2020 22:08:41.0690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4faa3872-698e-4896-80ec-148b916cb1ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M5K+c8BQO2OEQhEXOxspPHp2bUxYq8KlK8FrwePSA/E8//lIuE+vbvOu8+9v5dQQZ+xt324Gzl/N2V8Q184WUHlauunl3uDXzCMQBT6uDMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7P191MB0347
X-MDID: 1581545323-QLBE0A7A8d2Y
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

DQpPbiAxMi8wMi8yMDIwIDEwOjE1LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+IFRoZSBQ
aXN0YWNoaW8gcGxhdGZvcm0gY29kZSBpcyBub3QgYSBjbG9jayBwcm92aWRlciwgYW5kIGp1c3Qg
bmVlZHMgdG8NCj4gY2FsbCBvZl9jbGtfaW5pdCgpLg0KPg0KPiBIZW5jZSBpdCBjYW4gaW5jbHVk
ZSA8bGludXgvb2ZfY2xrLmg+IGluc3RlYWQgb2YgPGxpbnV4L2Nsay1wcm92aWRlci5oPi4NCj4N
Cj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4NCj4gLS0tDQo+ICAgYXJjaC9taXBzL3Bpc3RhY2hpby90aW1lLmMgfCAyICstDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYg
LS1naXQgYS9hcmNoL21pcHMvcGlzdGFjaGlvL3RpbWUuYyBiL2FyY2gvbWlwcy9waXN0YWNoaW8v
dGltZS5jDQo+IGluZGV4IDNjOTIzNWM3NzEwYTYwOGYuLmRlNjQ3NTFkZWM0MDE5OTAgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvbWlwcy9waXN0YWNoaW8vdGltZS5jDQo+ICsrKyBiL2FyY2gvbWlwcy9w
aXN0YWNoaW8vdGltZS5jDQo+IEBAIC02LDEwICs2LDEwIEBADQo+ICAgICovDQo+ICAgDQo+ICAg
I2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiAtI2luY2x1ZGUgPGxpbnV4L2Nsay1wcm92aWRlci5o
Pg0KPiAgICNpbmNsdWRlIDxsaW51eC9jbG9ja3NvdXJjZS5oPg0KPiAgICNpbmNsdWRlIDxsaW51
eC9pbml0Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ICsjaW5jbHVkZSA8bGludXgv
b2ZfY2xrLmg+DQo+ICAgDQo+ICAgI2luY2x1ZGUgPGFzbS9taXBzLWNwcy5oPg0KPiAgICNpbmNs
dWRlIDxhc20vdGltZS5oPg0KDQpUaGFua3MgZm9yIHRoZSB1cGRhdGUgR2VlcnQuDQoNCkFja2Vk
LWJ5OiBKYW1lcyBIYXJ0bGV5IDxqYW1lcy5oYXJ0bGV5QHNvbmRyZWwuY29tPg0KDQo=

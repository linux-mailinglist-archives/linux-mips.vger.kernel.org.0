Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E157121F5
	for <lists+linux-mips@lfdr.de>; Thu,  2 May 2019 20:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfEBSfx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 14:35:53 -0400
Received: from mail-eopbgr710127.outbound.protection.outlook.com ([40.107.71.127]:16667
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726120AbfEBSfv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 2 May 2019 14:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CW3M9GASHKnVeoB82q76TUa/+ngbnYFHa2gPc3gyhL4=;
 b=RC29ySgJgXo7CTuyhZymN+kMZPK03yRM+GqtCPRfY8nc8i4S/v68mzfYtQXM1svqV6iiHdJqkHLdNGcMir02xOk4/2bSUxR9ouGsrlbixRR70htIRLP9HPwSW6TlaWcyoWQx/qvtj6xuhzqbci9daKquBKHYa6fq2Yr/oyp3eMY=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1582.namprd22.prod.outlook.com (10.174.167.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Thu, 2 May 2019 18:35:49 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765%7]) with mapi id 15.20.1835.018; Thu, 2 May 2019
 18:35:49 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Serge Semin <fancer.lancer@gmail.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Huacai Chen <chenhc@lemote.com>,
        Stefan Agner <stefan@agner.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Juergen Gross <jgross@suse.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 05/12] mips: Discard post-CMA-init foreach loop
Thread-Topic: [PATCH 05/12] mips: Discard post-CMA-init foreach loop
Thread-Index: AQHU+ibRWe6RzUktm0+0HvNuqWcOC6ZYN2sA
Date:   Thu, 2 May 2019 18:35:49 +0000
Message-ID: <MWHPR2201MB12776E9CFF2B64CA6A5071CFC1340@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190423224748.3765-6-fancer.lancer@gmail.com>
In-Reply-To: <20190423224748.3765-6-fancer.lancer@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0084.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::25) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cd200da-3d46-4ff1-e846-08d6cf2cff96
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1582;
x-ms-traffictypediagnostic: MWHPR2201MB1582:
x-microsoft-antispam-prvs: <MWHPR2201MB15822363B8717B5E423E0F14C1340@MWHPR2201MB1582.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(396003)(376002)(366004)(39840400004)(199004)(189003)(33656002)(53936002)(52116002)(9686003)(99286004)(54906003)(229853002)(7696005)(6916009)(6436002)(186003)(4326008)(486006)(6116002)(476003)(3846002)(2906002)(26005)(11346002)(42882007)(102836004)(6506007)(386003)(446003)(44832011)(71190400001)(71200400001)(8676002)(4744005)(66066001)(81166006)(7736002)(478600001)(55016002)(76176011)(74316002)(7416002)(52536014)(316002)(66476007)(66556008)(73956011)(64756008)(66446008)(66946007)(256004)(25786009)(8936002)(81156014)(14454004)(68736007)(5660300002)(305945005)(6246003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1582;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: B95AZDzjrMEj9gECkbmYCiX5at5E2DUChhxecrGaPIR5/YX+0BdDXEBQEz7Yuvnl6UKdcUWM069CuuupZLPOMGI0aVZZbzNN96fdG0at5PF2D5mVGBvF6W4j09X3nnb3sFWyZeVLOSamwyXiZP2cnYeSUE9vcJ5YimL3Uq4a8jJv09dPTr0tssmuQwxwyqiYiGOxIwEpWv1vA1hvDGEkZHWd4fNMFmUl8j+/9I7ixWGaCvxHJWidBUdfYZYwy7sJGUK6Vo+34GVPcETwZjtB0vpKzy973EHbeejZSoedFAW6Aid16kdm102h2kRKiexRmqj6xHIQhvvadCN+bU65dH2ZVXCAF/8SkEebOzU+EBQ3sRvY5pyfPpxSSOhDjwZ4CEishl6T62Kcfu9x4Lo7lMHrAqXdYXaOSVQFawS7Dj4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd200da-3d46-4ff1-e846-08d6cf2cff96
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 18:35:49.6527
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1582
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClNlcmdlIFNlbWluIHdyb3RlOg0KPiBSZWFsbHkgdGhlIGxvb3AgaXMgcG9pbnRs
ZXNzLCBzaW5jZSBpdCB3YWxrcyBvdmVyIG1lbWJsb2NrLXJlc2VydmVkDQo+IG1lbW9yeSByZWdp
b25zIGFuZCBtYXJrIHRoZW0gYXMgcmVzZXJ2ZWQgaW4gbWVtYmxvY2suIEJlZm9yZQ0KPiBib290
bWVtIHdhcyByZW1vdmVkIGZyb20gdGhlIGtlcm5lbCwgdGhpcyBsb29wIGhhZCBiZWVuDQo+IHVz
ZWQgdG8gbWFwIHRoZSBtZW1vcnkgcmVzZXJ2ZWQgYnkgQ01BIGludG8gdGhlIGxlZ2FjeSBib290
bWVtDQo+IGFsbG9jYXRvci4gQnV0IG5vdyB0aGUgZWFybHkgbWVtb3J5IGFsbG9jYXRvciBpcyBt
ZW1ibG9jaywNCj4gd2hpY2ggaXMgdXNlZCBieSBDTUEgZm9yIHJlc2VydmF0aW9uLCBzbyB3ZSBk
b24ndCBuZWVkIGFueSBtYXBwaW5nDQo+IGFueW1vcmUuDQo+IA0KPiBSZXZpZXdlZC1ieTogTWF0
dCBSZWRmZWFybiA8bWF0dC5yZWRmZWFybkBtaXBzLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogU2Vy
Z2UgU2VtaW4gPGZhbmNlci5sYW5jZXJAZ21haWwuY29tPg0KDQpBcHBsaWVkIHRvIG1pcHMtbmV4
dC4NCg0KVGhhbmtzLA0KICAgIFBhdWwNCg0KWyBUaGlzIG1lc3NhZ2Ugd2FzIGF1dG8tZ2VuZXJh
dGVkOyBpZiB5b3UgYmVsaWV2ZSBhbnl0aGluZyBpcyBpbmNvcnJlY3QNCiAgdGhlbiBwbGVhc2Ug
ZW1haWwgcGF1bC5idXJ0b25AbWlwcy5jb20gdG8gcmVwb3J0IGl0LiBdDQo=

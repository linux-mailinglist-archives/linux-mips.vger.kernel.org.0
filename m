Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69D9A195D6
	for <lists+linux-mips@lfdr.de>; Fri, 10 May 2019 01:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfEIXxC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 May 2019 19:53:02 -0400
Received: from mail-eopbgr780139.outbound.protection.outlook.com ([40.107.78.139]:29123
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726844AbfEIXxC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 May 2019 19:53:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYGqBX63tA60qBG1hs5cM1rf7Uz6fbt8Tj0S45vayHE=;
 b=JU3V6Slay9iGHpZwYw9Th6Uu6glePYFGF5nf/IWEzLYJGo0amwI98/kU22yUXgOqG0UfTzQCjIoqp3qtQ5lBWWv/0FSHAAYsIu8qhfZy7jf64DAN31dkieeFTmx4SJNLRYNi3jGQOujxdaOTYSgk9LBSyQPvbA1bvgVNtaqw4N4=
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com (10.171.214.23) by
 CY4PR2201MB1207.namprd22.prod.outlook.com (10.171.210.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Thu, 9 May 2019 23:52:59 +0000
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::954e:662f:d233:dc53]) by CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::954e:662f:d233:dc53%4]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 23:52:59 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] MIPS: SGI-IP27: abstract chipset irq from bridge
Thread-Topic: [PATCH v4 3/3] MIPS: SGI-IP27: abstract chipset irq from bridge
Thread-Index: AQHVBRkryOfw2/KhWEyFVoaA8M+joaZjenSA
Date:   Thu, 9 May 2019 23:52:59 +0000
Message-ID: <CY4PR2201MB1272406CC69FD29A513B0B83C1330@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20190507210917.4691-4-tbogendoerfer@suse.de>
In-Reply-To: <20190507210917.4691-4-tbogendoerfer@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0047.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::24) To CY4PR2201MB1272.namprd22.prod.outlook.com
 (2603:10b6:910:6e::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [73.93.154.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0ae2869-190a-4e97-93c9-08d6d4d976d2
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:CY4PR2201MB1207;
x-ms-traffictypediagnostic: CY4PR2201MB1207:
x-microsoft-antispam-prvs: <CY4PR2201MB120703CE6F11C2DE5989F7A7C1330@CY4PR2201MB1207.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(346002)(39850400004)(396003)(366004)(189003)(199004)(2906002)(486006)(53936002)(446003)(6116002)(6246003)(256004)(476003)(11346002)(4326008)(76176011)(74316002)(6436002)(25786009)(186003)(9686003)(3846002)(54906003)(42882007)(55016002)(44832011)(33656002)(71190400001)(71200400001)(305945005)(68736007)(6916009)(316002)(229853002)(102836004)(386003)(6506007)(7736002)(478600001)(4744005)(52536014)(26005)(8936002)(66066001)(66446008)(81166006)(81156014)(8676002)(66946007)(66556008)(64756008)(73956011)(66476007)(99286004)(5660300002)(52116002)(14454004)(7696005);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1207;H:CY4PR2201MB1272.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NFyaUL6bX3JKgFDQ2BufdZYW+jQWgHXqor6X4qmwDr2WHLXkskxiZfCLR0jvGKz8lUM2qcMF7zgO5iUx8LtQoLKc42emgjkuvW8IaktBFZXUf0B66vXz/NZAjVs8BuufHPsYEMnDw3Zf1Rj7M33EjZk+asNHKj0A8pxjKdkUI0mA0eTKoHlvMpBW37fQBIDSanJzMJnuAj1EOKVOX8gGDBI1FbQGc6viCYWcRe+Gwq0r7CKipt4nPbvY56LgvzUg78IUDhU3PL9gWQMPrqlvaAOOtQZkh62hpd55ERYZpygEM5GpzSFyHuA49uxUVX9hT2rQx4CzKdKOSDRKdL+VKwgk1OGNbgKDMgt8TtPBGgjsmUXE+acDZ5OTFDWxKZqZqjqBjhuKTKw7WIAQ3/LTSfUrbL+m3xVRYQlsmqQ7tqc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ae2869-190a-4e97-93c9-08d6d4d976d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 23:52:59.0931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR2201MB1207
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClRob21hcyBCb2dlbmRvZXJmZXIgd3JvdGU6DQo+IEJyaWRnZSBBU0lDIGlzIHdp
ZGVseSB1c2VkIGluIGRpZmZlcmVudCBTR0kgc3lzdGVtcywgYnV0IHRoZSBjb25uZWN0ZWQNCj4g
Y2hpcHNldCBpcyBlaXRoZXIgSFVCLCBIRUFSVCBvciBCRURST0NLLiBUaGlzIGNvbW1pdCBzd2l0
Y2hlcyB0bw0KPiBpcnEgZG9tYWluIGhpZXJhcmNoeSBmb3IgaHViIGFuZCBicmlkZ2UgaW50ZXJy
dXB0cyB0byBnZXQgYnJpZGdlDQo+IHNldHVwIG91dCBvZiBodWIgaW50ZXJydXB0IGNvZGUuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgQm9nZW5kb2VyZmVyIDx0Ym9nZW5kb2VyZmVyQHN1
c2UuZGU+DQoNCkFwcGxpZWQgdG8gbWlwcy1uZXh0Lg0KDQpUaGFua3MsDQogICAgUGF1bA0KDQpb
IFRoaXMgbWVzc2FnZSB3YXMgYXV0by1nZW5lcmF0ZWQ7IGlmIHlvdSBiZWxpZXZlIGFueXRoaW5n
IGlzIGluY29ycmVjdA0KICB0aGVuIHBsZWFzZSBlbWFpbCBwYXVsLmJ1cnRvbkBtaXBzLmNvbSB0
byByZXBvcnQgaXQuIF0NCg==

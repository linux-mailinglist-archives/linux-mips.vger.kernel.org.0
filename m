Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED1F6A98D7
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 05:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730652AbfIEDSB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Sep 2019 23:18:01 -0400
Received: from mail-eopbgr710100.outbound.protection.outlook.com ([40.107.71.100]:3440
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730651AbfIEDSB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 4 Sep 2019 23:18:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGYMJe6x2r/4LIDSxLahkjpSxTU7EolCka4qV1LRoi6LBvw2BgTS03+dIKpoR5mbUli3cMO+RUeX5b09v7HrwTxlNFJHNkSjMxgBq7x1QB9Ri7hfzpFP9PbCYlJJzzP6TiGoqHalKTFxNkp8wJensvpCG+3g7xK2BmSKAjc6vIfKbWrf12+Wii8lkHPAxAuQix2h2me2OnKb6BF2LC/0IE88O9EeWRP6B5jJwF09ToHqAWIFFM4nKQA+ScoSKyDyoXoLx5DQHtQhg02qQX5MNHM7xKhjSR5aQBSb13i13t2BSCwezyIlorRX17BbTup9FZ0Q7agbJzK6Sc/hHNZ6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvvwdmqc38A/1uPgG/1fKYRMjBCuuogLgXV+7jcE9Sc=;
 b=AXeB1BXLrh44eDpNOZIOXc/EAGFiD/PFSTaqGQ9tSAGK3vxDqNyiXyStNn+5BHAkfxq9bEjHGNwfoBwQZ+RpRI2sAtV6lr6U/0wGY4ORYeoHT48tt9HPySLnVfmOSwGVs+k1SCMP8NZX9VoSgmuFPTOcwA1RbbNCLf3kwzlF8XHnNsalF6LxHZm5xh9cVg+FJOZ+dGu3moEBN6Ve8Lf9aViyjUdnUeD7QNvmK+Ud8NdfBAItHfJOHZZcaiAqQfoXyjiZVmJcAonASNoj1XqpaBGjZaQ56/hxILKPYcKUSFkKAGSTz0INP5CawngjIIXXOYpqFn4oVtm4cB8RkWrFlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=wavecomp.com;
 dkim=pass header.d=wavecomp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvvwdmqc38A/1uPgG/1fKYRMjBCuuogLgXV+7jcE9Sc=;
 b=OE47rA3J7dE00I/jrAx1irb0ymRGqncCLHwNTlOT3LbF5PEA5li5ddXJH9/jiUeFUf1Ec+M0YoyTixI9xjI1sM/gLSxpE/gofP+DAyAa5EXYsLwU5+jDsUdx+G2+vyt6Tb+ojbu7vQdbKppPNib0QuqvoJ67vKTx3ia/vutbNy8=
Received: from CY4PR22MB0405.namprd22.prod.outlook.com (10.173.195.146) by
 CY4PR22MB1000.namprd22.prod.outlook.com (10.172.139.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Thu, 5 Sep 2019 03:17:57 +0000
Received: from CY4PR22MB0405.namprd22.prod.outlook.com
 ([fe80::8c46:5da7:f906:c6ea]) by CY4PR22MB0405.namprd22.prod.outlook.com
 ([fe80::8c46:5da7:f906:c6ea%4]) with mapi id 15.20.2220.021; Thu, 5 Sep 2019
 03:17:56 +0000
From:   Zhongwu Zhu <zzhu@wavecomp.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Tommy Jin <tjin@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: =?gb2312?B?tPC4tDogW0VYVEVSTkFMXVJlOiBbUEFUQ0hdIE1JUFM2NDogYWRkIEtBU0FO?=
 =?gb2312?Q?_support?=
Thread-Topic: [EXTERNAL]Re: [PATCH] MIPS64: add KASAN support
Thread-Index: AQHVXLFs0tG/c5h8Kka7BqSfDHskmacSAboAgApu6GA=
Date:   Thu, 5 Sep 2019 03:17:56 +0000
Message-ID: <CY4PR22MB0405AB0E7E26CFF4B3E9800FBCBB0@CY4PR22MB0405.namprd22.prod.outlook.com>
References: <1566894474-31011-1-git-send-email-tjin@wavecomp.com>
 <20190829113320.GB9113@alpha.franken.de>
In-Reply-To: <20190829113320.GB9113@alpha.franken.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=zzhu@wavecomp.com; 
x-originating-ip: [218.108.86.174]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f31776b5-d643-498e-4ddd-08d731afa5f5
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR22MB1000;
x-ms-traffictypediagnostic: CY4PR22MB1000:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR22MB100098A5FDDDF957B533B8C0BCBB0@CY4PR22MB1000.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(136003)(396003)(376002)(39850400004)(199004)(189003)(8936002)(6506007)(102836004)(256004)(53936002)(14444005)(4326008)(9686003)(76176011)(33656002)(14454004)(55016002)(316002)(26005)(110136005)(86362001)(71190400001)(6436002)(25786009)(7696005)(76116006)(66066001)(66946007)(71200400001)(66476007)(2906002)(99286004)(64756008)(478600001)(186003)(81156014)(52536014)(6636002)(66446008)(5660300002)(11346002)(305945005)(476003)(66556008)(7736002)(486006)(74316002)(3846002)(446003)(6116002)(81166006)(224303003);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR22MB1000;H:CY4PR22MB0405.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: smkNpXfDZnQN07vfS1bsK1YD2zJHYmyeyUjiS1z4tzOFqe1cE0ID1RPBKIQinnldNXkhBQgiSIursOW2cQMD2b1Ks1nNL4FKrSMiOq9DjkC0SalXuRi8TCXik53FMyzD9FnyWqCNNZOKYOVmhhWEOYsGRLwJ5cmL2807CW1r4TjShS1Q15Abi1VhxQruaSrGG35LwZy7PD0MnZmX7mXcC4GJQ8mZFER6HwoutkBx47ENP7OSMw3EckFrPdUYgeiIJ+KDVHdQ+EMODiVjSlUITNd50crQkEr01lSxGZRdcMLyXo6PXFyRV2gfj9PaMEGaeX739mVCCvw2DG9OXJYDnDEgeANKbJ9wOrabHgYvPDsq8Vd9Rc6SCxNQZWchdEh6hj8++aTXAYkiDSi5AxCSBrfIDGP9TuIgTN2PUvb6SpQ=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31776b5-d643-498e-4ddd-08d731afa5f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 03:17:56.8939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aSdqPuVjPxKDScOSO1bocEQwiSgDizXYWwTrO8B2aUyet6fZNWxZUjpaFrbkMJNKUWl4NfUToU7U896BwfD0xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR22MB1000
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGkgVGhvbWFzLA0KCVRvbW15IGFuZCBtZSBhcmUgcmVzcG9uc2libGUgZm9yIG1pcHMgS0FTQU4g
aXNzdWUuIFRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50cy4NCglXZSBkaWRuJ3QgY29uc2lkZXIg
Y2FjaGFibGUgbm9uIGNvaGVyZW50ICgweDk4KSBhbmQgY2FjaGFibGUgZXhjbHVzaXZlICgweGEw
KSBtYWlubHkgYmVjYXVzZSB3ZSBoYWQgbm90IHNlZW4gdGhlbSBiZSB1c2VkLiBEbyB5b3Uga25v
dyBpbiB3aGljaCBjYXNlIHRoaXMgdHdvIHNlZ21lbnQgYWRkcmVzcyB3aWxsIGJlIGFwcGxpZWQv
YWNjZXNzZWQ/DQoJYnV0IGlmIHRoZXNlIHR3byBzZWdtZW50cyBhcmUgcmVhbGx5IG5lZWRlZCwg
d2UgY2FuIGFkZCBpdCB0byBvdXIgY29kZS4gQW5kIGNvcnJlc3BvbmRpbmdseSB0aGUgS0FTQU4g
YWRkcmVzcyBzcGFjZSBuZWVkIHRvIGJlIGV4dGVuZC4oZnJvbSA1MTJHIHRvIDEwMjRHLCB0aGF0
IGlzIGNoYW5nZSB0aGUgUEdEX09SREVSIGZyb20gMSB0byAyKS4NCkJSDQpaaG9uZ3d1DQoNCi0t
LS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBUaG9tYXMgQm9nZW5kb2VyZmVyIDx0c2JvZ2VuZEBh
bHBoYS5mcmFua2VuLmRlPiANCreiy83KsbzkOiAyMDE5xOo41MIyOcjVIDE5OjMzDQrK1bz+yMs6
IFRvbW15IEppbiA8dGppbkB3YXZlY29tcC5jb20+DQqzrcvNOiBsaW51eC1taXBzQHZnZXIua2Vy
bmVsLm9yZzsgWmhvbmd3dSBaaHUgPHp6aHVAd2F2ZWNvbXAuY29tPg0K1vfM4jogW0VYVEVSTkFM
XVJlOiBbUEFUQ0hdIE1JUFM2NDogYWRkIEtBU0FOIHN1cHBvcnQNCg0KT24gVHVlLCBBdWcgMjcs
IDIwMTkgYXQgMDg6Mjg6MzhBTSArMDAwMCwgVG9tbXkgSmluIHdyb3RlOg0KPiArLyogNjQtYml0
IHNlZ21lbnQgdmFsdWUuICovDQo+ICsjZGVmaW5lIFhLUEhZU19DQUNIRV9TRUcJKDB4YTgpDQoN
CnRoYXQncyBqdXN0IGNhY2hhYmxlIGNvaGVyZW50IGV4Y2x1c2l2ZSBvbiB3cml0ZSwgd2hhdCBh
Ym91dCBjYWNoYWJsZSBub24gY29oZXJlbnQgKDB4OTgpIGFuZCBjYWNoYWJsZSBleGNsdXNpdmUg
KDB4YTApID8NCg0KVGhvbWFzLg0KDQotLQ0KQ3JhcCBjYW4gd29yay4gR2l2ZW4gZW5vdWdoIHRo
cnVzdCBwaWdzIHdpbGwgZmx5LCBidXQgaXQncyBub3QgbmVjZXNzYXJpbHkgYQ0KZ29vZCBpZGVh
LiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFsgUkZDMTky
NSwgMi4zIF0NCg==

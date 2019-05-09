Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC162195D2
	for <lists+linux-mips@lfdr.de>; Fri, 10 May 2019 01:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbfEIXww (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 May 2019 19:52:52 -0400
Received: from mail-eopbgr780121.outbound.protection.outlook.com ([40.107.78.121]:47168
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726620AbfEIXww (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 May 2019 19:52:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1opa8gVoiMWdXjeoP5MH2to97rq4aewECLBK+VStt8=;
 b=oqyWi5844ecp/tCDrJ4PVCIHwBIlrtQ/koxd0goGsbRA8QDjuH3EI17DNfMRNFsoH8yopZVYZKAwF/GNZS05B8q5lKkbRIzkGL30rEstj1BlHx8kx/T8Ons7fe7Q8lqFrd1oU+ljwfXE5M/HFI4ADB96Ih7U9UctgP0cDaExlkc=
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com (10.171.214.23) by
 CY4PR2201MB1207.namprd22.prod.outlook.com (10.171.210.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Thu, 9 May 2019 23:52:48 +0000
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::954e:662f:d233:dc53]) by CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::954e:662f:d233:dc53%4]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 23:52:48 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
CC:     "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" 
        <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH fixes v2] MIPS: perf: Fix build with CONFIG_CPU_BMIPS5000
  enabled
Thread-Topic: [PATCH fixes v2] MIPS: perf: Fix build with CONFIG_CPU_BMIPS5000
  enabled
Thread-Index: AQHVBsJOzEtNJUx6U0yfGCTcJdB0/w==
Date:   Thu, 9 May 2019 23:52:48 +0000
Message-ID: <CY4PR2201MB1272133F3A938CA88D7099EDC1330@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20190509183047.18408-1-f.fainelli@gmail.com>
In-Reply-To: <20190509183047.18408-1-f.fainelli@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::22) To CY4PR2201MB1272.namprd22.prod.outlook.com
 (2603:10b6:910:6e::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [73.93.154.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bbf069e-ee91-45eb-6d78-08d6d4d97073
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:CY4PR2201MB1207;
x-ms-traffictypediagnostic: CY4PR2201MB1207:
x-microsoft-antispam-prvs: <CY4PR2201MB120702E3016E85168D053ABAC1330@CY4PR2201MB1207.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(346002)(39850400004)(396003)(366004)(189003)(199004)(2906002)(486006)(53936002)(446003)(6116002)(6246003)(256004)(476003)(11346002)(4326008)(76176011)(74316002)(6436002)(25786009)(186003)(9686003)(3846002)(54906003)(42882007)(55016002)(44832011)(33656002)(71190400001)(71200400001)(305945005)(68736007)(6916009)(316002)(229853002)(102836004)(386003)(7416002)(6506007)(7736002)(478600001)(4744005)(52536014)(26005)(8936002)(66066001)(66446008)(81166006)(81156014)(8676002)(66946007)(66556008)(64756008)(73956011)(66476007)(99286004)(5660300002)(52116002)(14454004)(7696005);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1207;H:CY4PR2201MB1272.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ym0WuYgV/tRX+OlxbSuj+LFsEHTnwxCs/prW/bKx+N3lYhPucRcMr/4Y+uwausEBioJFqRL2V87tk3ULAENmqabr78yyr13E8BcPnqqHSa4PcgvHTkVJ9BaJfU6bHtO6MDyplYUOhk1LQQNlcKIdVtdM7rouGS6fu3Jpsc2XtnLik+1QZHgjGxQEVGy5B1S8UZlVBoCEDT+k8StynQyJEmPxz1evTJTqIDk78DpM9tyfelUb2BJB9RV+oZONGRY0he3TQOQ5gqNNzpfs6z/uGZEf1SpxVMongMG2zxlzkeJLRI/OuIMVMmScfzZxLQruNNCU2dCzjFatoTKy2qVHpjSKdE1YqwqorBsLkrJ8JOHuAxA1/Hv6DjahzzatuX5evu22Ixy2R8ZxnuuTsINQd9mZeSJZUWYcfk2ztL6xh7Q=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bbf069e-ee91-45eb-6d78-08d6d4d97073
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 23:52:48.4663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR2201MB1207
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNCkZsb3JpYW4gRmFpbmVsbGkgd3JvdGU6DQo+IGFyY2gvbWlwcy9rZXJuZWwvcGVy
Zl9ldmVudF9taXBzeHguYzogSW4gZnVuY3Rpb24gJ21pcHN4eF9wbXVfZW5hYmxlX2V2ZW50JzoN
Cj4gYXJjaC9taXBzL2tlcm5lbC9wZXJmX2V2ZW50X21pcHN4eC5jOjMyNjoyMTogZXJyb3I6IHVu
dXNlZCB2YXJpYWJsZSAnZXZlbnQnIFstV2Vycm9yPXVudXNlZC12YXJpYWJsZV0NCj4gc3RydWN0
IHBlcmZfZXZlbnQgKmV2ZW50ID0gY29udGFpbmVyX29mKGV2dCwgc3RydWN0IHBlcmZfZXZlbnQs
IGh3KTsNCj4gXn5+fn4NCj4gDQo+IEZpeCB0aGlzIGJ5IG1ha2luZyB1c2Ugb2YgSVNfRU5BQkxF
RCgpIHRvIHNpbXBsaWZ5IHRoZSBjb2RlIGFuZCBhdm9pZA0KPiB1bm5lY2Vzc2FyeSBpZmRlZmVy
eS4NCj4gDQo+IEZpeGVzOiA4NDAwMmM4ODU5OWQgKCJNSVBTOiBwZXJmOiBGaXggcGVyZiB3aXRo
IE1UIGNvdW50aW5nIG90aGVyIHRocmVhZHMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBGbG9yaWFuIEZh
aW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4NCg0KQXBwbGllZCB0byBtaXBzLW5leHQuDQoN
ClRoYW5rcywNCiAgICBQYXVsDQoNClsgVGhpcyBtZXNzYWdlIHdhcyBhdXRvLWdlbmVyYXRlZDsg
aWYgeW91IGJlbGlldmUgYW55dGhpbmcgaXMgaW5jb3JyZWN0DQogIHRoZW4gcGxlYXNlIGVtYWls
IHBhdWwuYnVydG9uQG1pcHMuY29tIHRvIHJlcG9ydCBpdC4gXQ0K

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B22250B12
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 23:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgHXVpW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 17:45:22 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:51108 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727913AbgHXVpS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 17:45:18 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07OLenmg017518;
        Mon, 24 Aug 2020 14:45:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=YuFuzOO91iSg5oyy//8ib/18Qk/pOyk1qzUnyumRwTw=;
 b=HfuhhlNFPLONZYWqKCPllX2LQXr5OvZr4GC98tS7wcb4Q0zSZAZ388JOWfTFKwamq4tH
 fOduLISnSapqZFiCchgVVoW4t+33ATKmijgKCoxWBkbNQFuPK9RJzXXkTS33AwAObGXV
 C3QDXtxOFaeQy7pDbm7bg8nvJ/Zl90jk8bg= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 33313tj53h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 24 Aug 2020 14:45:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 24 Aug 2020 14:45:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMD+RIxU8jtDmn0oegQnI9Y1wxoyUyRsWMOyJQG2AYJSXQoiCYV4qBt06wK+WohsBNRTP9QEx7BMIfAkgdmbHjjvrQpLXlRNTF+cEGgMP0h7lauFJQQ6WW86PFtMMvgMNyNUuTGwNfdIjdz0lpT52ITUbvX8+/0mmoT7gA+Is2ufbjgEGEYbEOhQZxXvKkANM2U9eKUSDzzKrcsE3EoyIT3vnxVqf3c6DC1s7zPh3mo85l/rF+HT19phC5PNtVBo3bA8DMh2n6cIq2TKk/RW9tktR/Qedu88KwuuwE1muDJpyqvdTINXi10pmt5eQEEWl6ZYCk8KWXAzMo20oM6hIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuFuzOO91iSg5oyy//8ib/18Qk/pOyk1qzUnyumRwTw=;
 b=DsJtIeybPxHuiIN3UCu7SnwCYccaPEyt/KTCH0uFQkrrg3suTKe3nW8syiZ0Hmvp0Jba1tBfoxhzHR0wz6MxbXaCg3W02vg4TJs9zDJtH41v1LFtXK1hjmlQ3EJN+rHAOmc/Rp0nTLjDybFtzmGwZvZGOUNrWNYuTAa34M/6il7fsbZ3tQGEnksxsXURbKWJ4lR9QCeOp+1Dq9+ZZ3FY77i3emmNTZ9CBGQoh+h5XnDZ5kDQT8zWRCfzrnXAvKplDPAg/tBKHfnDGLtIvRXgQogixcubIvvfXQUMyqEhXRUbjmNeOKCjgVUdReEZYyXWKax+23S3GgOGvBQBunpnUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuFuzOO91iSg5oyy//8ib/18Qk/pOyk1qzUnyumRwTw=;
 b=BHtEUfkwOrGatWE5yO88KY6WTfDh4EHk/Sc3+dG9JShfMu2wAOFF+E8ZeiOlXVTeueVj0wagL+290JGMaK04nnzSNfmhlnIddT+62eJELKct6DIu0B0OjJewKT/qtJwFFCGuFHCJxP5ZSIMftsu6FK90aqFni1tLkk9LcDPouIw=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2408.namprd15.prod.outlook.com (2603:10b6:a02:85::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 21:45:08 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea%3]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 21:45:08 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "od@zcrc.me" <od@zcrc.me>
Subject: Re: [PATCH 2/2] MIPS: Add support for ZSTD-compressed kernels
Thread-Topic: [PATCH 2/2] MIPS: Add support for ZSTD-compressed kernels
Thread-Index: AQHWd9hubhseyyY4wEOiGjoaqbo/sqlHsDKAgAATuwCAAAwMgA==
Date:   Mon, 24 Aug 2020 21:45:08 +0000
Message-ID: <96AE5D79-D0DC-4E43-B7F1-41C373BDD1BF@fb.com>
References: <20200821162948.146947-1-paul@crapouillou.net>
 <20200821162948.146947-2-paul@crapouillou.net>
 <41742AA6-8BC0-46E5-8735-9B3D6E83FA2D@fb.com>
 <CF6LFQ.EXKNOXDIOE502@crapouillou.net>
In-Reply-To: <CF6LFQ.EXKNOXDIOE502@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: crapouillou.net; dkim=none (message not signed)
 header.d=none;crapouillou.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:d050]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e9c9890-a4ef-4879-c77d-08d84876f858
x-ms-traffictypediagnostic: BYAPR15MB2408:
x-microsoft-antispam-prvs: <BYAPR15MB24080D0E0AD33EB14C5E36DDAB560@BYAPR15MB2408.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5hdYUADXiVITPkmpsOeYr65pdrVkTD42+a/7y8wyLfJzent07W5BfMimbTsNlCw1Iudv3epyIYXij5ouY1hIbh4YGpL/5stuuf2nG67rIdKdOXMYwusykz4NgwVFbEnb7pjkJ46+EY4flT2kOqDor6gN1720e9Gzd7oe8dl5cbAQjN94dG/yCXARwWh5LmlV6pWMCv5OLOlB9qJBEijgQLCBUc1MY9bcZeYy6NUbx5QzvrPO5r+5DcAHFbtKe6x8vVPv7cDlSbgITQe+Yqwz1AHkasEDuBDrGXPQBTXghEjelNvre0bLagI8uEFBnOrJG1WFVcFg/gnsCN5YFU9NDNsQnCJ1aMRUnWo9pmLUOt+sejOvGHD7ui3Za+D7fRjRz8f1uCwHAhbzT3EAkfbNlw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(39860400002)(346002)(396003)(136003)(83380400001)(5660300002)(2616005)(4326008)(6486002)(478600001)(54906003)(53546011)(8676002)(186003)(6506007)(86362001)(33656002)(76116006)(6512007)(36756003)(66446008)(2906002)(71200400001)(8936002)(316002)(64756008)(66476007)(66946007)(6916009)(966005)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: MMfzVwCDhGxZP5tIO1Sq6TxEaYZkiOnEVNnIxExBylGID8exScRhCSfkeZmD/fsqdoeAcykP6gUspHfKSBefIt8ZSkqIrZB7ICNhOiXOlEVNilWOGljpiKMIEWF41nsIkgwJeS4/clD2Atfi5uAwKcbMRZcGjkpSN03mUglvpV8GP0VXD4ICgcdXJylSMxfhZTAN5SnWR8dQlw0lkGXZp23R0kE0frC1RnYeD+W5gk8JujXI1IAH46bpbV09lR4JepmHdyuasWxw/PD/8W0lqf7Ryx5qgY1+oTjuwM9uOqGS9UJp6wD/BlgN+7qhJ3LWOU1GIs+jvDV2NcJof/E3sajBBNigxbAGazLBOlgHXs59+9xxlJJTvTsbgpUl5t/lxTrXSv64VKnmmaI/+FoD3Qa1VSgRDqPMPFKGgHgLrThdAitJrBpQVPTv48sxEoK8GkmwHzuLDuqgH6G66s0KC8UYbfg0LfSjG6jl9Y7fAxzyn/lMv2pBXeM1HhJ5wTzr+DAUQjPTZ7xe3NZ343ypg5ogxEmdYykZ3hI1T1mkg6II0GtAr2wwJb9B6umsl2kB+bvTD7OuHEkJLdn3IO7EPmeLQQ5LtyuGAUoCLG2QiXyu6l/uGvvL65njNSjATk0l3l2T5q/cJ1t/90CzzHAErsrZJ1YmXDONDWmInRV9RacgbH64H35MU2sw4BST6PpT
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2763A5DBB1884C4A9397A025309F1B97@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9c9890-a4ef-4879-c77d-08d84876f858
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 21:45:08.1494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ms0oTxgFS8/RhZjnV/fOuRuh8zO+4SSf8d1Q4k0MZAagzbvyLfGtGRxpatB1gsMY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2408
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-24_12:2020-08-24,2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008240171
X-FB-Internal: deliver
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

DQoNCj4gT24gQXVnIDI0LCAyMDIwLCBhdCAyOjAyIFBNLCBQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4gd3JvdGU6DQo+IA0KPiBIaSBOaWNrLA0KPiANCj4gTGUgbHVuLiAyNCBh
b8O7dCAyMDIwIMOgIDE5OjUxLCBOaWNrIFRlcnJlbGwgPHRlcnJlbGxuQGZiLmNvbT4gYSDDqWNy
aXQgOg0KPj4+IE9uIEF1ZyAyMSwgMjAyMCwgYXQgOToyOSBBTSwgUGF1bCBDZXJjdWVpbCA8cGF1
bEBjcmFwb3VpbGxvdS5uZXQ+IHdyb3RlOg0KPj4+IEFkZCBzdXBwb3J0IGZvciBzZWxmLWV4dHJh
Y3Rpbmcga2VybmVscyB3aXRoIGEgWlNURCBjb21wcmVzc2lvbi4NCj4+PiBUZXN0ZWQgb24gYSBr
ZXJuZWwgZm9yIHRoZSBHQ1ctWmVybywgaXQgYWxsb3dzIHRvIHJlZHVjZSB0aGUgc2l6ZSBvZiB0
aGUNCj4+PiBrZXJuZWwgZmlsZSBmcm9tIDQuMSBNaUIgd2l0aCBnemlwIHRvIDMuNSBNaUIgd2l0
aCBaU1RELCBhbmQgYm9vdHMganVzdA0KPj4+IGFzIGZhc3QuDQo+Pj4gU2lnbmVkLW9mZi1ieTog
UGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+DQo+Pj4gLS0tDQo+Pj4gYXJjaC9t
aXBzL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgMSArDQo+Pj4gYXJjaC9taXBzL2Jv
b3QvY29tcHJlc3NlZC9NYWtlZmlsZSAgICAgfCAgMSArDQo+Pj4gYXJjaC9taXBzL2Jvb3QvY29t
cHJlc3NlZC9kZWNvbXByZXNzLmMgfCAgNCArKysrDQo+Pj4gYXJjaC9taXBzL2Jvb3QvY29tcHJl
c3NlZC9zdHJpbmcuYyAgICAgfCAxNiArKysrKysrKysrKysrKysrDQo+Pj4gNCBmaWxlcyBjaGFu
Z2VkLCAyMiBpbnNlcnRpb25zKCspDQo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9LY29uZmln
IGIvYXJjaC9taXBzL0tjb25maWcNCj4+PiBpbmRleCBjOTVmYTNhMjQ4NGMuLmI5ZDdjNDI0OWRj
OSAxMDA2NDQNCj4+PiAtLS0gYS9hcmNoL21pcHMvS2NvbmZpZw0KPj4+ICsrKyBiL2FyY2gvbWlw
cy9LY29uZmlnDQo+Pj4gQEAgLTE4OTAsNiArMTg5MCw3IEBAIGNvbmZpZyBTWVNfU1VQUE9SVFNf
WkJPT1QNCj4+PiAJc2VsZWN0IEhBVkVfS0VSTkVMX0xaTUENCj4+PiAJc2VsZWN0IEhBVkVfS0VS
TkVMX0xaTw0KPj4+IAlzZWxlY3QgSEFWRV9LRVJORUxfWFoNCj4+PiArCXNlbGVjdCBIQVZFX0tF
Uk5FTF9aU1REDQo+Pj4gY29uZmlnIFNZU19TVVBQT1JUU19aQk9PVF9VQVJUMTY1NTANCj4+PiAJ
Ym9vbA0KPj4+IGRpZmYgLS1naXQgYS9hcmNoL21pcHMvYm9vdC9jb21wcmVzc2VkL01ha2VmaWxl
IGIvYXJjaC9taXBzL2Jvb3QvY29tcHJlc3NlZC9NYWtlZmlsZQ0KPj4+IGluZGV4IDZlNTZjYWVm
NjlmMC4uODZkZGM2ZmMxNmY0IDEwMDY0NA0KPj4+IC0tLSBhL2FyY2gvbWlwcy9ib290L2NvbXBy
ZXNzZWQvTWFrZWZpbGUNCj4+PiArKysgYi9hcmNoL21pcHMvYm9vdC9jb21wcmVzc2VkL01ha2Vm
aWxlDQo+Pj4gQEAgLTcwLDYgKzcwLDcgQEAgdG9vbF8kKENPTkZJR19LRVJORUxfTFo0KSAgICAg
PSBsejQNCj4+PiB0b29sXyQoQ09ORklHX0tFUk5FTF9MWk1BKSAgICA9IGx6bWENCj4+PiB0b29s
XyQoQ09ORklHX0tFUk5FTF9MWk8pICAgICA9IGx6bw0KPj4+IHRvb2xfJChDT05GSUdfS0VSTkVM
X1haKSAgICAgID0geHprZXJuDQo+Pj4gK3Rvb2xfJChDT05GSUdfS0VSTkVMX1pTVEQpICAgID0g
enN0ZA0KPj4gWW91IGNhbiB1c2UgenN0ZDIyIGhlcmUuIEl0IHdpbGwgZ2l2ZSB5b3Ugc2xpZ2h0
bHkgYmV0dGVyIGNvbXByZXNzaW9uDQo+PiB3aXRob3V0IGFueSBhZGRpdGlvbmFsIG1lbW9yeSB1
c2FnZS4gQWxzbywgeW91IHNob3VsZCBhZGQNCj4+IC1EX19ESVNBQkxFX0VYUE9SVFMgdG8gdGhl
IEtCVUlMRF9DRkxBR1MgbGlrZSB4ODYgZG9lcyBbMV0uDQo+IA0KPiBJbmRlZWQsIGl0J3MgMC4w
MSUgc21hbGxlciA6KQ0KPiANCj4gV2hhdCBpcyBfX0RJU0FCTEVfRVhQT1JUUyBmb3I/DQoNCkl0
IGRpc2FibGVzIHRoZSBFWFBPUlRfU1lNQk9MKCkgbWFjcm9zIGluc2lkZSBvZiBsaWIvenN0ZC9k
ZWNvbXByZXNzLmMuDQpPbiB4ODYgdGhlIGtlcm5lbCB3b27igJl0IGJvb3Qgd2l0aCB0aGVzZSBk
ZWZpbmVkLiBPdGhlciBkZWNvbXByZXNzb3JzIGhpZGUNCnRoZW0gaWYgdGhlIFNUQVRJQyBtYWNy
byBpcyBkZWZpbmVkLCBidXQgenN0ZCB1c2VzIHRoaXMgbWV0aG9kLCB3aGljaCB3YXMNCmFkZGVk
IHNvbWV3aGF0IHJlY2VudGx5Lg0KDQotTmljaw0KDQo+IC1QYXVsDQo+IA0KPj4gWzFdIGh0dHBz
Oi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9hcmNoL3g4Ni9ib290L2Nv
bXByZXNzZWQvTWFrZWZpbGUNCj4+IC1OaWNrDQo+Pj4gdGFyZ2V0cyArPSB2bWxpbnV4LmJpbi56
DQo+Pj4gJChvYmopL3ZtbGludXguYmluLno6ICQob2JqKS92bWxpbnV4LmJpbiBGT1JDRQ0KPj4+
IGRpZmYgLS1naXQgYS9hcmNoL21pcHMvYm9vdC9jb21wcmVzc2VkL2RlY29tcHJlc3MuYyBiL2Fy
Y2gvbWlwcy9ib290L2NvbXByZXNzZWQvZGVjb21wcmVzcy5jDQo+Pj4gaW5kZXggODhmNWQ2Mzdi
MWM0Li5jNjFjNjQxNjc0ZTYgMTAwNjQ0DQo+Pj4gLS0tIGEvYXJjaC9taXBzL2Jvb3QvY29tcHJl
c3NlZC9kZWNvbXByZXNzLmMNCj4+PiArKysgYi9hcmNoL21pcHMvYm9vdC9jb21wcmVzc2VkL2Rl
Y29tcHJlc3MuYw0KPj4+IEBAIC03Miw2ICs3MiwxMCBAQCB2b2lkIGVycm9yKGNoYXIgKngpDQo+
Pj4gI2luY2x1ZGUgIi4uLy4uLy4uLy4uL2xpYi9kZWNvbXByZXNzX3VueHouYyINCj4+PiAjZW5k
aWYNCj4+PiArI2lmZGVmIENPTkZJR19LRVJORUxfWlNURA0KPj4+ICsjaW5jbHVkZSAiLi4vLi4v
Li4vLi4vbGliL2RlY29tcHJlc3NfdW56c3RkLmMiDQo+Pj4gKyNlbmRpZg0KPj4+ICsNCj4+PiBj
b25zdCB1bnNpZ25lZCBsb25nIF9fc3RhY2tfY2hrX2d1YXJkID0gMHgwMDBhMGRmZjsNCj4+PiB2
b2lkIF9fc3RhY2tfY2hrX2ZhaWwodm9pZCkNCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2Jv
b3QvY29tcHJlc3NlZC9zdHJpbmcuYyBiL2FyY2gvbWlwcy9ib290L2NvbXByZXNzZWQvc3RyaW5n
LmMNCj4+PiBpbmRleCA0M2JlZWNjMzU4N2MuLmFiOTU3MjJlYzBjOSAxMDA2NDQNCj4+PiAtLS0g
YS9hcmNoL21pcHMvYm9vdC9jb21wcmVzc2VkL3N0cmluZy5jDQo+Pj4gKysrIGIvYXJjaC9taXBz
L2Jvb3QvY29tcHJlc3NlZC9zdHJpbmcuYw0KPj4+IEBAIC0yNywzICsyNywxOSBAQCB2b2lkICpt
ZW1zZXQodm9pZCAqcywgaW50IGMsIHNpemVfdCBuKQ0KPj4+IAkJc3NbaV0gPSBjOw0KPj4+IAly
ZXR1cm4gczsNCj4+PiB9DQo+Pj4gKw0KPj4+ICt2b2lkICptZW1tb3ZlKHZvaWQgKmRlc3QsIGNv
bnN0IHZvaWQgKnNyYywgc2l6ZV90IG4pDQo+Pj4gK3sNCj4+PiArCXVuc2lnbmVkIGludCBpOw0K
Pj4+ICsJY29uc3QgY2hhciAqcyA9IHNyYzsNCj4+PiArCWNoYXIgKmQgPSBkZXN0Ow0KPj4+ICsN
Cj4+PiArCWlmICgodWludHB0cl90KWRlc3QgPCAodWludHB0cl90KXNyYykgew0KPj4+ICsJCWZv
ciAoaSA9IDA7IGkgPCBuOyBpKyspDQo+Pj4gKwkJCWRbaV0gPSBzW2ldOw0KPj4+ICsJfSBlbHNl
IHsNCj4+PiArCQlmb3IgKGkgPSBuOyBpID4gMDsgaS0tKQ0KPj4+ICsJCQlkW2kgLSAxXSA9IHNb
aSAtIDFdOw0KPj4+ICsJfQ0KPj4+ICsJcmV0dXJuIGRlc3Q7DQo+Pj4gK30NCj4+PiAtLQ0KPj4+
IDIuMjguMA0KDQo=

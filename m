Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92BAA2509CB
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 22:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgHXULY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 16:11:24 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:51560 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725946AbgHXULV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 16:11:21 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07OKAPgd023015;
        Mon, 24 Aug 2020 13:11:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=j8wbXSb7Oi8M3ikjYAebD5DasDulkBee7Qt9TRNLGts=;
 b=M1PyAGHTjCp75G6eedWOuwK0kr7CTapbzQOGxkgYBPuV3YbG5ogbEuFWWkGhcwkYbEwC
 K2csNx6to8ZYFRUrsBS4B1WPxlCKwwbRjBORxcZ+fBVnGBq6ULrGpyVKHnQSKHaP7A9A
 q/0phdi+pNgbzrDtJQyUZugJbrr49hnL9jU= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 33316f1r1f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 24 Aug 2020 13:11:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 24 Aug 2020 13:11:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hoWR4E6i13o5Yhf/vNZLEh8IqMB+wjvLQ9PEgwW72G9iNnzX2qtfmya6NrgUhQgMdiU3b9rRs4d43dAiLKmmkNvc9qIOXRqKniP8Aq6Hi9z9pkpu7bCXf7W3SoyLvpan+0iGnU1UKMyt0fnDzrWKndIOf1lpTU0jqZ6VS0+JNzyaKyFnVdm24DemiuWeZitUXLc8Pi8XdNxRUf5J1BIt2KIPO2Mec47CHKF7m5Iak5gMRLDWVJ+kAPDuPTkvanJUe47TKU5RSpPERUwdAKTisqoHDhlrIlmZbkvvwdRt5SKEEHzilP/+E/HiRATKVCF8xxMVSam/zIiTvxWlHq6JhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8wbXSb7Oi8M3ikjYAebD5DasDulkBee7Qt9TRNLGts=;
 b=BFnSrc2bMSnatJeN6HQM/vp2M4lrm9jMnXwpeX/Hd4lUEby7n+XCImhB9si87xPmcmFeludb3VOUhr8iayvMFVGzPkQ5IhX6wKiNeZ11eA7wzTcoZkPeF26k84gIURKpE2+aSGeo/vcUnZjwH29rf+zuBsqpwg23CWJQH6861wqPyxqSB1/SBrsfRx0mBMPGde8ij+daBDz2QZzDXmZSad1Vh0PvDCxEyqqIbMirCkxu8yfVSD1XauHJqvwukKWEAUcAnCJFo2jaM6itpK7VDB5bvbYhpw/jgxjwCXP/yUpA2eqhJUc62tTnYOAYrR7Bu/K13589CFRrhD/IjJxp4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8wbXSb7Oi8M3ikjYAebD5DasDulkBee7Qt9TRNLGts=;
 b=RdwuC1KXg0hbIi1tBD5W0Ep77Rfrh/vYU0ZdrnYHCoQ6j16jlhfRBUZ93w2nJPKkHpXZx/UspYkDDalLwHV8g7JbrgV9sih4/5IcbeYsQMjEJHfjDdxoxTq7dlbe7s84bsW47Eox70iveZpE7UMOb5/izXakrR8z9mtTc0Yzw/A=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2581.namprd15.prod.outlook.com (2603:10b6:a03:15a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Mon, 24 Aug
 2020 20:11:13 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea%3]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 20:11:13 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "od@zcrc.me" <od@zcrc.me>
Subject: Re: [PATCH 1/2] lib: decompress_unzstd: Limit output size
Thread-Topic: [PATCH 1/2] lib: decompress_unzstd: Limit output size
Thread-Index: AQHWd9hunYA3PypfW06cD4Fch/Sxu6lHtbsA
Date:   Mon, 24 Aug 2020 20:11:12 +0000
Message-ID: <8E3C6FC0-2DF0-49B5-9885-BA4AC81A117D@fb.com>
References: <20200821162948.146947-1-paul@crapouillou.net>
In-Reply-To: <20200821162948.146947-1-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: crapouillou.net; dkim=none (message not signed)
 header.d=none;crapouillou.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:d050]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce39047c-d70b-46fd-64a2-08d84869d97d
x-ms-traffictypediagnostic: BYAPR15MB2581:
x-microsoft-antispam-prvs: <BYAPR15MB2581A251337AF87402D71BE2AB560@BYAPR15MB2581.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zb5J5elSJ1++9xlmfKJae00+eQSzxkD6nHUS2J+A5ifMoVGtynonCTSoEFWt5w3l1Wv8IWvKNtRReB1p9ZHc8szbRJjEvI6LuPXULlFqleuUaWGK7y/h9kj/+HcwPUrAQtif+7Ylw9vV15rK0qwVbfTMi5q2qpWA8IsvlaLkw14uA4iBzxkIASx244rhmeN38b1pkoSJDRh+W1yhpHMG+rTD+Zbx8lWFyZDwBaI6ydYdsOpGLx+7xGm7aEQ8yCn76+hCBA1CaUEaiiNajXR1cW/6ENsysnw+q3OTYsvPlXNCsLvk9nyZ4V29MF1yeXf4WoO0ZAcOSTeXXMRITpqmxQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(376002)(346002)(366004)(136003)(66556008)(316002)(8936002)(6512007)(6506007)(53546011)(2906002)(8676002)(76116006)(71200400001)(83380400001)(64756008)(66476007)(66946007)(54906003)(66446008)(2616005)(86362001)(6486002)(4326008)(478600001)(33656002)(5660300002)(36756003)(6916009)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: WhvyZHg1VGfIhb3kBEWmvXQghrmlCFbVEblMIfJl7nblP3gwq9aytJKKiUjIClmLGFV0enN5o7z3QqZtHm4u7SQ5I0Wggv8u56AGmXkmUJ3CWx7K9AlPqmWKVEob9GbMjWOffVbGl6EkU0w7j/hxfQYYgA5ejqssmoSwGXcfMC69LOOp6X8W+VUpVh4/hnB+c1oGXO3Lj6IysiT8V4Hpr+wUH1rzICyfynWyXbt23pJRWA20wH0gwP7pjGKkVNSrsGbybUO7HTYZQbeZIvzTCWBTXYDmRuv1oXbLS1gp48yEfLXSMPiHinJqDkYtrt7nN56TqeIEvlBSFJ5LPYMQclI3Q18cGWVIqp3GRTiuR6U/z28uJJy4QRzOqOUyUABPzi4m4cNb9Uj2JMRca83ZTL5QTdpTKZzTSwpq0Y16nCW0A+SK9KzL8KEW/Hi6qbzLIMtOHiijPdFvg4Z1migtogTTjdq68zbfZ2HnrHxOx+P4EyEpgXl9O70GMov2/KJrnNJwYQ/nMF8Xxpp/peh59sc0ttfcP9iF2Go2SgLMwpn5UiUM5YVBs1kidnvqgocTyaPPa6L8Seca9agsal4cRjH9yMJFeG65wf3jPy72PYoNsf167ma2W1H3uSnK2TIv/KaUK2A1JWl/vjD20l03KxbvbcMpUXv2j2g7KZBEiCIx8x7iim5pr73DDkON3d5t
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <173D7138118501489F1DCBACA0A7AAAC@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce39047c-d70b-46fd-64a2-08d84869d97d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 20:11:12.9065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9yawshEyCfornSHr9ZbcWld3dk67mQ0985bKFRmBlUfqNgyxZC7dtzGpnCZ76pKT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2581
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-24_12:2020-08-24,2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008240158
X-FB-Internal: deliver
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

DQoNCj4gT24gQXVnIDIxLCAyMDIwLCBhdCA5OjI5IEFNLCBQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4gd3JvdGU6DQo+IA0KPiBUaGUgenN0ZCBkZWNvbXByZXNzaW9uIGNvZGUs
IGFzIGl0IGlzIHJpZ2h0IG5vdywgd2lsbCBoYXZlIGludGVybmFsDQo+IHZhbHVlcyBvdmVyZmxv
dyBvbiAzMi1iaXQgc3lzdGVtcyB3aGVuIHRoZSBvdXRwdXQgc2l6ZSBpcyBMT05HX01BWC4NCj4g
DQo+IFVudGlsIHNvbWVvbmUgc21hcnRlciB0aGFuIG1lIGNhbiBmaWd1cmUgb3V0IGhvdyB0byBm
aXggdGhlIHpzdGQgY29kZQ0KPiBwcm9wZXJseSwgbGltaXQgdGhlIGRlc3RpbmF0aW9uIGJ1ZmZl
ciBzaXplIHRvIDUxMiBNaUIsIHdoaWNoIHNob3VsZCBiZQ0KPiBlbm91Z2ggZm9yIGV2ZXJ5Ym9k
eSwgaW4gb3JkZXIgdG8gbWFrZSBpdCB1c2FibGUgb24gMzItYml0IHN5c3RlbXMuDQoNCkNhbiB5
b3UgYnVtcCB0aGUgc2l6ZSB1cCB0byAyR0I/IEkgc3VzcGVjdCB0aGUgcHJvYmxlbSBpbnNpZGUg
b2YgenN0ZA0KaXMgYW4gb2ZmLWJ5LW9uZSBlcnJvciBvciBzb21ldGhpbmcgc2ltaWxhciwgc28g
Z2V0dGluZyBjbG9zZXIgdG8gdGhlIGxpbWl0DQpzaG91bGRuJ3QgYmUgYSBwcm9ibGVtLiBJ4oCZ
ZCBmZWVsIG1vcmUgY29tZm9ydGFibGUgd2l0aCAyR0IsIHNpbmNlDQprZXJuZWxzIGNhbiBnZXQg
cHJldHR5IGxhcmdlLg0KDQpIbW0sIHpzdGQgc2hvdWxkbuKAmXQgYmUgb3ZlcmZsb3dpbmcgdGhh
dCB2YWx1ZS4gSeKAmW0gY3VycmVudGx5IHByZXBhcmluZw0KYSBwYXRjaCB0byB1cGRhdGluZyB0
aGUgdmVyc2lvbiBvZiB6c3RkIGluIHRoZSBrZXJuZWwsIGFuZCB1c2luZyB1cHN0cmVhbQ0KZGly
ZWN0bHkuIEkgd2lsbCBhZGQgYSB0ZXN0IHVwc3RyZWFtIGluIDMyLWJpdCBtb2RlIHRvIGVuc3Vy
ZSB0aGF0IHdlIGRvbuKAmXQNCm92ZXJmbG93IGEgMzItYml0IHNpemVfdCwgc28gdGhpcyB3aWxs
IGJlIGZpeGVkIGFmdGVyIHRoZSB1cGRhdGUuDQoNCi1OaWNrDQoNCj4gU2lnbmVkLW9mZi1ieTog
UGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+DQo+IC0tLQ0KPiBsaWIvZGVjb21w
cmVzc191bnpzdGQuYyB8IDMgKystDQo+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIvZGVjb21wcmVzc191bnpzdGQu
YyBiL2xpYi9kZWNvbXByZXNzX3VuenN0ZC5jDQo+IGluZGV4IDBhZDJjMTU0NzllZC4uZTFjMDNi
MWVhYTZlIDEwMDY0NA0KPiAtLS0gYS9saWIvZGVjb21wcmVzc191bnpzdGQuYw0KPiArKysgYi9s
aWIvZGVjb21wcmVzc191bnpzdGQuYw0KPiBAQCAtNzcsNiArNzcsNyBAQA0KPiANCj4gI2luY2x1
ZGUgPGxpbnV4L2RlY29tcHJlc3MvbW0uaD4NCj4gI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0K
PiArI2luY2x1ZGUgPGxpbnV4L3NpemVzLmg+DQo+ICNpbmNsdWRlIDxsaW51eC96c3RkLmg+DQo+
IA0KPiAvKiAxMjhNQiBpcyB0aGUgbWF4aW11bSB3aW5kb3cgc2l6ZSBzdXBwb3J0ZWQgYnkgenN0
ZC4gKi8NCj4gQEAgLTE3OSw3ICsxODAsNyBAQCBzdGF0aWMgaW50IElOSVQgX191bnpzdGQodW5z
aWduZWQgY2hhciAqaW5fYnVmLCBsb25nIGluX2xlbiwNCj4gCXNpemVfdCByZXQ7DQo+IA0KPiAJ
aWYgKG91dF9sZW4gPT0gMCkNCj4gLQkJb3V0X2xlbiA9IExPTkdfTUFYOyAvKiBubyBsaW1pdCAq
Lw0KPiArCQlvdXRfbGVuID0gU1pfNTEyTTsgLyogc2hvdWxkIGJlIGJpZyBlbm91Z2gsIHJpZ2h0
PyAqLw0KPiANCj4gCWlmIChmaWxsID09IE5VTEwgJiYgZmx1c2ggPT0gTlVMTCkNCj4gCQkvKg0K
PiAtLSANCj4gMi4yOC4wDQo+IA0KDQo=

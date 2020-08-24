Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7BA4250B23
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 23:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbgHXVut (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 17:50:49 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:55520 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726090AbgHXVus (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Aug 2020 17:50:48 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07OLm5ra013093;
        Mon, 24 Aug 2020 14:50:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=49LlbvJKpb3IfFTFWLEeFP/4k2QqnzKnodE6uCL9iSY=;
 b=Eau4ulYkRDgRy31OBZfBLtNa6pEh9kRLfSz6ogl5lP9IYlrfhQhZUf/1m0Q0OPXUspU0
 +wTnpIo8P9Cz1BcWYO5bgB/4eWmMqXdpkEnsUEtw3AlAXpeh2hWoMHiZ2THH2T0w8A4g
 s5L4tMz48masVCIA2Qz39oG9LfrYDxRlZwE= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 333k6jybff-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 24 Aug 2020 14:50:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 24 Aug 2020 14:50:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G56SpIKM1FrNo+AZXmcix1YzzSZVafl034KgDi1L5MQdp9Oppu4fbbfBbqc22Q/K93HTis2FpYUrEIAXBqpSobJQ4NizZ78Zz232wLbGqGJ/ZJRCegIl9SUlmkKfqzF+kiBKPsLPuwIoZZHVqDrVJydtHrqzx+wkYWKzgIsv5TG8b/eBp6gjkJ8eRyotCGcAaI34RxX+Q5QxMIQDSuKNoGpmEvhCl506fn4z2bZWfbgBg60Om2Jg41Dtb6IGlzNPZf6n+QnmULrC+h8RPeoHe6JJgOq9w+FKQgQAdZzIdzRzUPQvf7F6MYBFPYIst2ExMAbDq0ST2oKNbkIPCMO0uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49LlbvJKpb3IfFTFWLEeFP/4k2QqnzKnodE6uCL9iSY=;
 b=Vtz2GYfYPk+bKtxeFzkkuiheFrQAIpDMeNunIckUvKc3bdONA0ugVsQxSfNBGdXvokDGjoOZoNW5Dd0glxdoiiaJSDppdvsXXofnKUDDF5wZfKV/qI3Ib+CqBwm8KleOPF35PK3zjQR+xVRzoGFq3wMlWXHd6Pw8lxjS0nO3D3UXZA/l6GW1fxXeJulTkMoX1xBxty2HMAaiapW2Dt6SBoBxjIGgO7CWmgxE55pOIawhqj1Tsc4k7FOIbe4VuFYgevPZIm4cylb/XxNHSm9sdqnlSBJ8lcbnKtmtoZODmkHasbWDtYb0uiJjgcNLrUSTdLJDeNRCuPffUEfuM+pBwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49LlbvJKpb3IfFTFWLEeFP/4k2QqnzKnodE6uCL9iSY=;
 b=eDxGqgAXnm7amIZE0Wgaw7kXYaIoxeBSfEafydJIgKAWA3XYaeujvw8W6eVeDLAxNx/WjtW09dZf4dgPYWPliERZQbMrxIevZOeAzVz/8UEhw66wqFB37tmc7RjBecFizNbwf10Cs+XGkaQF12u/CP3cnZVLqCGYBw7TnlHVInI=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2408.namprd15.prod.outlook.com (2603:10b6:a02:85::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 21:50:37 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea%3]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 21:50:37 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "od@zcrc.me" <od@zcrc.me>
Subject: Re: [PATCH 1/2] lib: decompress_unzstd: Limit output size
Thread-Topic: [PATCH 1/2] lib: decompress_unzstd: Limit output size
Thread-Index: AQHWd9hunYA3PypfW06cD4Fch/Sxu6lHtbsAgAAPTgCAAAx5gA==
Date:   Mon, 24 Aug 2020 21:50:37 +0000
Message-ID: <D0112FE3-394D-44DB-9D5C-60A789A67A4D@fb.com>
References: <20200821162948.146947-1-paul@crapouillou.net>
 <8E3C6FC0-2DF0-49B5-9885-BA4AC81A117D@fb.com>
 <YL6LFQ.1E9SOADXFSGD2@crapouillou.net>
In-Reply-To: <YL6LFQ.1E9SOADXFSGD2@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: crapouillou.net; dkim=none (message not signed)
 header.d=none;crapouillou.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:d050]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fe3f229-532c-4252-ed51-08d84877bcb7
x-ms-traffictypediagnostic: BYAPR15MB2408:
x-microsoft-antispam-prvs: <BYAPR15MB2408683F9C2C89BA40F4531BAB560@BYAPR15MB2408.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +9DtAEkYWoIh2GIklKkjT+kQyAPWuCH4MyNOh/fGRwlrrgtIJ8g9f8+94fbF7z667ptlNXIk1RE8HxvFM1seDe46Q6dn1l+MCr+POM/XGSH3Rm4F2bgyul275ZD5gpbBfPtBRRzp0L0ymp3+uZ/2lXGDiBlVxIEclCi1bckEAKyLjiMJSMua+LzzcwAqhRo1T9OiB8r9zYMdrDJxPNAKfLWbGL3LAziLgUEAL4trgMdGPf6HOpkzlfJgjHfs9xbWiPe8rgvT/+0oHr5aukqzEALJ7F288bBFqdX9xPwaaUF5bB7qWGH5BOG1wfeJSFq9YUadEJCEd1IOkp3Qv6ZTZA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(346002)(39860400002)(366004)(376002)(66574015)(66446008)(6512007)(33656002)(76116006)(36756003)(66476007)(66946007)(64756008)(66556008)(6916009)(316002)(2906002)(8936002)(71200400001)(2616005)(6486002)(478600001)(4326008)(83380400001)(5660300002)(86362001)(54906003)(53546011)(186003)(8676002)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: /mr7wLDCScnQ03SltH1CXd3lP51m0x6uqxcZvFSnR6xKCc93UxM3xcZs+72wB8he++mTC8YcEfYrjUeB2kS48hUjfXJh9rtpw/bIVE8L0nIwKplRaMmoDEnv7lneEutf1zL9i5N6YEixdH/YFuZV9UxQx7dYf3t79yWwsZNI8JvE8crhCA2+lq336DyuYmKl7BLpxJr0XD2AbT4SkS7Id27gVy0Zcephv3SoEl20CYHyeI5c0e4JFxpDkO/VxBaK6WRrjbpVlDK5ikNGn2OStJkh+0s3zV31yEnqI1iAo1DRIxnpxP/En0RwMQZRHX03Fez5tUU4MA9eUe8p/PbN0Fpl0fiyzMNKa2qj8QBPMgG32J0nzjQ9mpdfHha84XvmraOfcmvsR+a80UHYZMop+jbU1VzCFNfW2uBdjuab1TYDVwLWOP33jDFntcvri1FuerpSBBZ5QWnjM4vGGTXSqbbA/1O71p4jpGNrIc6SsvrFG+7dqb70ibdkyE0XJLA7n56RnBmGf106D5iU58AEYYi/ex+/WLfXjhSljUa0zAKkkEKKVurG1aawDt9EmlgApoiBWUnC6huC0HYtBXP/pL8qKKpKs3itWZv3xMKNL9VI/CuCrrD9iCzFuoK3wWdp4U6hSNsXYEOuAoISZJfxIFBREaQINttJG6CEJ03e1U/udiouteGfF1324cPZBs8I
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0829510B4E26444BB5A6E6E2491D393C@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe3f229-532c-4252-ed51-08d84877bcb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 21:50:37.6274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: USaAXB2PvQSqziIH6CTijWY7WamSZ75pSaFP67XWGK7McharxRqRFf63wB/hNT3w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2408
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-24_12:2020-08-24,2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008240172
X-FB-Internal: deliver
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

DQoNCj4gT24gQXVnIDI0LCAyMDIwLCBhdCAyOjA1IFBNLCBQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IExlIGx1bi4gMjQgYW/Du3QgMjAy
MCDDoCAyMDoxMSwgTmljayBUZXJyZWxsIDx0ZXJyZWxsbkBmYi5jb20+IGEgw6ljcml0IDoNCj4+
PiBPbiBBdWcgMjEsIDIwMjAsIGF0IDk6MjkgQU0sIFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91
aWxsb3UubmV0PiB3cm90ZToNCj4+PiBUaGUgenN0ZCBkZWNvbXByZXNzaW9uIGNvZGUsIGFzIGl0
IGlzIHJpZ2h0IG5vdywgd2lsbCBoYXZlIGludGVybmFsDQo+Pj4gdmFsdWVzIG92ZXJmbG93IG9u
IDMyLWJpdCBzeXN0ZW1zIHdoZW4gdGhlIG91dHB1dCBzaXplIGlzIExPTkdfTUFYLg0KPj4+IFVu
dGlsIHNvbWVvbmUgc21hcnRlciB0aGFuIG1lIGNhbiBmaWd1cmUgb3V0IGhvdyB0byBmaXggdGhl
IHpzdGQgY29kZQ0KPj4+IHByb3Blcmx5LCBsaW1pdCB0aGUgZGVzdGluYXRpb24gYnVmZmVyIHNp
emUgdG8gNTEyIE1pQiwgd2hpY2ggc2hvdWxkIGJlDQo+Pj4gZW5vdWdoIGZvciBldmVyeWJvZHks
IGluIG9yZGVyIHRvIG1ha2UgaXQgdXNhYmxlIG9uIDMyLWJpdCBzeXN0ZW1zLg0KPj4gQ2FuIHlv
dSBidW1wIHRoZSBzaXplIHVwIHRvIDJHQj8gSSBzdXNwZWN0IHRoZSBwcm9ibGVtIGluc2lkZSBv
ZiB6c3RkDQo+PiBpcyBhbiBvZmYtYnktb25lIGVycm9yIG9yIHNvbWV0aGluZyBzaW1pbGFyLCBz
byBnZXR0aW5nIGNsb3NlciB0byB0aGUgbGltaXQNCj4+IHNob3VsZG4ndCBiZSBhIHByb2JsZW0u
IEnigJlkIGZlZWwgbW9yZSBjb21mb3J0YWJsZSB3aXRoIDJHQiwgc2luY2UNCj4+IGtlcm5lbHMg
Y2FuIGdldCBwcmV0dHkgbGFyZ2UuDQo+IA0KPiBTWl8xRyBpcyB0aGUgYmlnZ2VzdCBJIGNhbiBn
byB0byBnZXQgdGhlIGtlcm5lbCB0byBib290LiBXaXRoIFNaXzJHIGl0IHdvbid0IGJvb3QuDQoN
ClN0cmFuZ2XigKYgSSBkb27igJl0IHF1aXRlIGtub3cgd2hhdCBpcyBnb2luZyBvbiB0aGVuLiBU
aGFua3MgZm9yIHRoZSBmaXghIFlvdSBjYW4gYWRkOg0KDQpSZXZpZXdlZC1CeTogTmljayBUZXJy
ZWxsIDx0ZXJyZWxsbkBmYi5jb20+DQoNCkJlc3QsDQpOaWNrDQoNCj4+IEhtbSwgenN0ZCBzaG91
bGRu4oCZdCBiZSBvdmVyZmxvd2luZyB0aGF0IHZhbHVlLiBJ4oCZbSBjdXJyZW50bHkgcHJlcGFy
aW5nDQo+PiBhIHBhdGNoIHRvIHVwZGF0aW5nIHRoZSB2ZXJzaW9uIG9mIHpzdGQgaW4gdGhlIGtl
cm5lbCwgYW5kIHVzaW5nIHVwc3RyZWFtDQo+PiBkaXJlY3RseS4gSSB3aWxsIGFkZCBhIHRlc3Qg
dXBzdHJlYW0gaW4gMzItYml0IG1vZGUgdG8gZW5zdXJlIHRoYXQgd2UgZG9u4oCZdA0KPj4gb3Zl
cmZsb3cgYSAzMi1iaXQgc2l6ZV90LCBzbyB0aGlzIHdpbGwgYmUgZml4ZWQgYWZ0ZXIgdGhlIHVw
ZGF0ZS4NCj4gDQo+IEdyZWF0LCB0aGFua3MuDQo+IA0KPiBDaGVlcnMsDQo+IC1QYXVsDQo+IA0K
Pj4gLU5pY2sNCj4+PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWls
bG91Lm5ldD4NCj4+PiAtLS0NCj4+PiBsaWIvZGVjb21wcmVzc191bnpzdGQuYyB8IDMgKystDQo+
Pj4gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+IGRp
ZmYgLS1naXQgYS9saWIvZGVjb21wcmVzc191bnpzdGQuYyBiL2xpYi9kZWNvbXByZXNzX3VuenN0
ZC5jDQo+Pj4gaW5kZXggMGFkMmMxNTQ3OWVkLi5lMWMwM2IxZWFhNmUgMTAwNjQ0DQo+Pj4gLS0t
IGEvbGliL2RlY29tcHJlc3NfdW56c3RkLmMNCj4+PiArKysgYi9saWIvZGVjb21wcmVzc191bnpz
dGQuYw0KPj4+IEBAIC03Nyw2ICs3Nyw3IEBADQo+Pj4gI2luY2x1ZGUgPGxpbnV4L2RlY29tcHJl
c3MvbW0uaD4NCj4+PiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQo+Pj4gKyNpbmNsdWRlIDxs
aW51eC9zaXplcy5oPg0KPj4+ICNpbmNsdWRlIDxsaW51eC96c3RkLmg+DQo+Pj4gLyogMTI4TUIg
aXMgdGhlIG1heGltdW0gd2luZG93IHNpemUgc3VwcG9ydGVkIGJ5IHpzdGQuICovDQo+Pj4gQEAg
LTE3OSw3ICsxODAsNyBAQCBzdGF0aWMgaW50IElOSVQgX191bnpzdGQodW5zaWduZWQgY2hhciAq
aW5fYnVmLCBsb25nIGluX2xlbiwNCj4+PiAJc2l6ZV90IHJldDsNCj4+PiAJaWYgKG91dF9sZW4g
PT0gMCkNCj4+PiAtCQlvdXRfbGVuID0gTE9OR19NQVg7IC8qIG5vIGxpbWl0ICovDQo+Pj4gKwkJ
b3V0X2xlbiA9IFNaXzUxMk07IC8qIHNob3VsZCBiZSBiaWcgZW5vdWdoLCByaWdodD8gKi8NCj4+
PiAJaWYgKGZpbGwgPT0gTlVMTCAmJiBmbHVzaCA9PSBOVUxMKQ0KPj4+IAkJLyoNCj4+PiAtLQ0K
Pj4+IDIuMjguMA0KPiANCj4gDQoNCg==

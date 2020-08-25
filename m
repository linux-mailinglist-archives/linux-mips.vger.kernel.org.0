Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABBA2523CA
	for <lists+linux-mips@lfdr.de>; Wed, 26 Aug 2020 00:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgHYWve (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Aug 2020 18:51:34 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:49908 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726672AbgHYWvd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Aug 2020 18:51:33 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07PModsN017669;
        Tue, 25 Aug 2020 15:51:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=M4MrdGeMtOwMcyy8yWZ1G2yjC1fRN0lpZywSTmNKCAM=;
 b=CoEHvz8iyxjJ9jr/9bKUDmSzysFXsPROH5d8dYhWP4mZqBKzxqtWnS6EPjZmV44DJoky
 fLHYtrirUwDiuExWDcsC33wcLJwgpgrgp5fMJVMvI4LAIAlMUA9nd9qIL0L4y54mDGJc
 H7TmN3jQerkh6PGNQUEMXyhEkE5BZnrhlts= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 3330vjrqau-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 25 Aug 2020 15:51:25 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 25 Aug 2020 15:51:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5j1Sim+kY49kY8IaB0j1OMo5KmUhkohBaGznSEutdLPpDl2WanXP8UX8XkE720biAsJWPwQA3W5lIDKEy8URMnVVFXK4cL4cPMD8H9QNDl57mqh8a94H33MHdtAjcHOdfmy/4et9fGHr/wRPm6ddQSS1lRtH9DAD15BW6uFis8kqRm2VIigh5gwTQfy51i6sdXRtDSRDEWQqOX2eIvr5cfxe2LcIOZq60LFhz9bUB6y4ZUxZ5IbXuZQUPSBKCSz3d/xouLOLVJ05S+iBMyaCT2H1GuqQhj9hFwBwbrTYgzTfmIsN/ajifri8JdXiYWUpr5DQ6uovaqmocttynlkOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4MrdGeMtOwMcyy8yWZ1G2yjC1fRN0lpZywSTmNKCAM=;
 b=Tw1Ebk7XT4QeTesUzpsugdo2aNh2JJ5bsXBTRKkNLlV9peLpUe9jhUPOmwzge1TthEfYLA7WlcGoPwM7EZy6SCnLiNfiTd2yodDhB7LtwlE9g+LwQe+9J2ZFG6PZxdBQKWFliHvcj2GTUGXseu5jrHiDqfQOQ1S60/94kJP8LkBsikAfjpxnGwZOFB9nnmoJClsh36hlUi26RcZMPobR3x4UqzbbAFJbJaMUwpxUbEoZJYDbczNlCq26MKpufh8/MccIQ6lBIlK7yyyxk7crmMJtBMSRng8smE6SLJxnBqNcpB1zp5j3d+YCx1iYTw98xs8MoH2zFWZcFiU/EZjFug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M4MrdGeMtOwMcyy8yWZ1G2yjC1fRN0lpZywSTmNKCAM=;
 b=VvTCJ942FrfvTweZFcizEzVUMXT70H5WhNml9LRegD8tGTNQoXkE3IZCpZ9uZVeFcbifPP+hk96Hvs8NgJ69lx5ET6wXaOz6a/ltD2+OGO2nM2wJ58Z9pGzrQkgRBOYCKaWV4a72IdvVK0uzcznYImM9yxpMYDQ17nj1kuFs0JA=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2584.namprd15.prod.outlook.com (2603:10b6:a03:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 22:51:08 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea%3]) with mapi id 15.20.3305.026; Tue, 25 Aug 2020
 22:51:08 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "od@zcrc.me" <od@zcrc.me>, "Yann Collet" <cyan@fb.com>
Subject: Re: [PATCH v2 1/2] lib: decompress_unzstd: Limit output size
Thread-Topic: [PATCH v2 1/2] lib: decompress_unzstd: Limit output size
Thread-Index: AQHWeyMWQ6UvCpHPl0W6+2O1jLwYH6lJbimA
Date:   Tue, 25 Aug 2020 22:51:08 +0000
Message-ID: <36FE5764-0CFC-44EC-8F3A-5A50F5391C57@fb.com>
References: <20200825210127.17850-1-paul@crapouillou.net>
In-Reply-To: <20200825210127.17850-1-paul@crapouillou.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: crapouillou.net; dkim=none (message not signed)
 header.d=none;crapouillou.net; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:ad82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f6d7753-7047-4733-a244-08d849495b3f
x-ms-traffictypediagnostic: BYAPR15MB2584:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB25843BE4081BDCE009F678B8AB570@BYAPR15MB2584.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qLpXPEKZ1hhptkm2vkiTqypcaSVMAcpOp4ZZcpysacLMgH/f07wOBa3SQPlZUhtDwACqtdu7YPu46YsHFnVYT4YssVsht06X40A+EQhwi8SDVXiZdaoMznpCjwn9G2et/fKBQM+m2Dtw3rmWz/liQGrG0T6t6S3R29aR547E/rN+/DTkOjFAIcfzam+oIAt5e3KVWZ0338tGfMVs0d9Pwk4zZuSZKfNhnUesHCj9my+lJhteJz9OI9RMEZa1Y0zfgmNAa/YzTahMhgeF9WLTCJ4CsuNO6vNXqrTNQbdbRosG9FOsWymzJ+XQwk9aD6ei
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(346002)(136003)(39860400002)(53546011)(33656002)(316002)(8676002)(8936002)(6506007)(36756003)(4326008)(6916009)(478600001)(2616005)(71200400001)(6512007)(54906003)(86362001)(2906002)(6486002)(5660300002)(186003)(76116006)(66446008)(66556008)(64756008)(66476007)(66946007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: EBM9Zq3/k6/MVpltMzFHB8LTVY2nbT39B/G/npyXCTm1bbUMXUbil/9ekVjbVv4J7RlsgFD2AXW4E7m1VV8sMJeGD6sgS2++flTNlTkiruQIZqhuBFgWrXpz+LvXvbCNXbY/L2LQXpSOUiWal1LprE9HfsKt4AwU6bkMweVRgdcMXsfqr/e/JsA+rOeVcArBmuOBr5UDHmCnN5ordcNkA3CggsvsBqhVOa5yoqc1bI4VbGj3D3rk/I2rgcPHTM/M253QpFQ9XmtG8Npc1ANrn9a5hzhxqTA+Yhn8exLqdsdSCxxtrRk3Eheehj18n2efuTG/riZ80b3iBls/a4TgxCATCBnioXI+PCY0QX5bFabE3L/pSNRq2tDxg6XQS8VPpBQz+1S++hQPmxve3C2XIVpFGEYLH6jwEB3bSqeM6guDiFWd8geXRmT0Jm6g/xpjnTbf+d5DqpB/fxhr5vB6j+FhwJemCeGZlrvMkEOT34qoZrPoFTP9hsHzpKA6FidqsY2cFppHs+4z/ROwITt6jVpg3fXehYwpJ9uj13k/8eV1lbuhmC3vqDYF94l44GFsB8w2PGF/1HYjiEdiU7SYFM+HPzZiqNRcCPQnqJA5olKJ+ZmVUnUiUm7EXecYxTp6/4X0tm7ux4yLrIgjqokJD07E2+PG3hxbUwHyo+Mu45TOn+kD4H1RzheDtgkL50k4
Content-Type: text/plain; charset="utf-8"
Content-ID: <09E9FA08649B7D45ABB2765269C66D52@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6d7753-7047-4733-a244-08d849495b3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2020 22:51:08.4242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1NCpu4iPuCPvLH97ok2AqQY5cNbEQLC+yV4uAETUUPAWe1OBC5S+qhuCo6DctaVo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2584
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-25_10:2020-08-25,2020-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008250170
X-FB-Internal: deliver
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

DQo+IE9uIEF1ZyAyNSwgMjAyMCwgYXQgMjowMSBQTSwgUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFw
b3VpbGxvdS5uZXQ+IHdyb3RlOg0KPiANCj4gVGhlIHpzdGQgZGVjb21wcmVzc2lvbiBjb2RlLCBh
cyBpdCBpcyByaWdodCBub3csIHdpbGwgaGF2ZSBpbnRlcm5hbA0KPiB2YWx1ZXMgb3ZlcmZsb3cg
b24gMzItYml0IHN5c3RlbXMgd2hlbiB0aGUgb3V0cHV0IHNpemUgaXMgYmlnZ2VyIHRoYW4NCj4g
MSBHaUIuDQo+IA0KPiBVbnRpbCBzb21lb25lIHNtYXJ0ZXIgdGhhbiBtZSBjYW4gZmlndXJlIG91
dCBob3cgdG8gZml4IHRoZSB6c3RkIGNvZGUNCj4gcHJvcGVybHksIGxpbWl0IHRoZSBkZXN0aW5h
dGlvbiBidWZmZXIgc2l6ZSB0byAxIEdpQiwgd2hpY2ggc2hvdWxkIGJlDQo+IGVub3VnaCBmb3Ig
ZXZlcnlib2R5LCBpbiBvcmRlciB0byBtYWtlIGl0IHVzYWJsZSBvbiAzMi1iaXQgc3lzdGVtcy4N
Cg0KSSB3YXMgdGFsa2luZyB3aXRoIFlhbm4gQ29sbGV0LCBhbmQgd2UgYmVsaWV2ZSB0aGF0IGl0
IGlzbuKAmXQgdGhlIGxvbmcgdGhhdA0KaXMgb3ZlcmZsb3dpbmcsIGJ1dCB0aGUgcG9pbnRlcnMu
IFpzdGQgZXhwZWN0cyB0byBiZSBnaXZlbiBhIHZhbGlkIG91dHB1dA0Kc2l6ZS4gSXQgZ2VuZXJh
bGx5IHVzZXMgYSBiZWdpbi9lbmQgcG9pbnRlciB3aXRoIGl0cyBvdXRwdXQgYnVmZmVyLiBTbyB3
aGVuDQppdCBpcyBnaXZlbiBhIHZlcnkgbGFyZ2Ugb3V0cHV0IHNpemUgaW4gMzItYml0IG1vZGUg
dGhlIGVuZCBwb2ludGVyIHdpbGwNCm92ZXJmbG93IHRoZSBwb2ludGVyIGVpdGhlciBjYXVzaW5n
IFVCLCBvciBlbmQgcG9pbnRlciA8IGJlZ2luIHBvaW50ZXIsDQp3aGljaCBicmVha3MgenN0ZC4N
Cg0KWnN0ZCB3aWxsIHByb2JhYmx5IG5ldmVyIGJlIGFibGUgdG8gd29yayBwcm9wZXJseSBpbiB0
aGlzIHdheS4gQSBiZXR0ZXINCnNvbHV0aW9uIG1pZ2h0IGJlIHRvIHBhc3MgTUFYX0FERFJFU1Nf
UFRSIC0gT1VUUFVUX1BUUiBhcw0KdGhlIHNpemUgdG8gdGhlIF9fZGVjb21wcmVzcygpIGNhbGwu
IE9yIHNvbWUgb3RoZXIgc2l6ZSB0aGF0IHdvbuKAmXQNCm92ZXJmbG93IHRoZSBwb2ludGVyLg0K
DQpCZXN0LA0KTmljaw0KDQo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3Jh
cG91aWxsb3UubmV0Pg0KPiBSZXZpZXdlZC1ieTogTmljayBUZXJyZWxsIDx0ZXJyZWxsbkBmYi5j
b20+DQo+IC0tLQ0KPiANCj4gTm90ZXM6DQo+ICAgIHYyOiBDaGFuZ2UgbGltaXQgdG8gMSBHaUIN
Cj4gDQo+IGxpYi9kZWNvbXByZXNzX3VuenN0ZC5jIHwgMyArKy0NCj4gMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi9k
ZWNvbXByZXNzX3VuenN0ZC5jIGIvbGliL2RlY29tcHJlc3NfdW56c3RkLmMNCj4gaW5kZXggMGFk
MmMxNTQ3OWVkLi40MTQ1MTdiYWVkYjAgMTAwNjQ0DQo+IC0tLSBhL2xpYi9kZWNvbXByZXNzX3Vu
enN0ZC5jDQo+ICsrKyBiL2xpYi9kZWNvbXByZXNzX3VuenN0ZC5jDQo+IEBAIC03Nyw2ICs3Nyw3
IEBADQo+IA0KPiAjaW5jbHVkZSA8bGludXgvZGVjb21wcmVzcy9tbS5oPg0KPiAjaW5jbHVkZSA8
bGludXgva2VybmVsLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvc2l6ZXMuaD4NCj4gI2luY2x1ZGUg
PGxpbnV4L3pzdGQuaD4NCj4gDQo+IC8qIDEyOE1CIGlzIHRoZSBtYXhpbXVtIHdpbmRvdyBzaXpl
IHN1cHBvcnRlZCBieSB6c3RkLiAqLw0KPiBAQCAtMTc5LDcgKzE4MCw3IEBAIHN0YXRpYyBpbnQg
SU5JVCBfX3VuenN0ZCh1bnNpZ25lZCBjaGFyICppbl9idWYsIGxvbmcgaW5fbGVuLA0KPiAJc2l6
ZV90IHJldDsNCj4gDQo+IAlpZiAob3V0X2xlbiA9PSAwKQ0KPiAtCQlvdXRfbGVuID0gTE9OR19N
QVg7IC8qIG5vIGxpbWl0ICovDQo+ICsJCW91dF9sZW4gPSBTWl8xRzsgLyogc2hvdWxkIGJlIGJp
ZyBlbm91Z2gsIHJpZ2h0PyAqLw0KPiANCj4gCWlmIChmaWxsID09IE5VTEwgJiYgZmx1c2ggPT0g
TlVMTCkNCj4gCQkvKg0KPiAtLSANCj4gMi4yOC4wDQo+IA0KDQo=

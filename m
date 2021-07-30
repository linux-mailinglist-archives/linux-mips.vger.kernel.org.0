Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A263DB3B4
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jul 2021 08:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237464AbhG3GeM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Jul 2021 02:34:12 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:53352 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237427AbhG3GeL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Jul 2021 02:34:11 -0400
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5532E40BFF;
        Fri, 30 Jul 2021 06:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1627626847; bh=RyyEkF8QLfzLd0aJhIU3cmCjcYDP/eXNiTevrsMXebc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=eaAi/5nTUt6qLBwgH1wqa1z3/h0bwG0obLLpj7sdjspscGqjZoBj9S16tNLBKRUhM
         MO7mZBI386S3mDwR9XBLD6jz8kiWxK45jc3pFIyrZMk7Pb1Y0YbKSwDwZ+FVOZEblw
         chk5R/9q6E1Z3kfB0rw2qeKpTg2LEZ1zpXD4+mbhx/mFLMgpOxnVRdPJn5em+TaigX
         rBX1J8HPZ+2b64HtEJ3LHEQPckmHEo5iYkhfKc7fFF1JzhT9wANrs0644xCR/5RGcu
         E1Pk0FMNMDAevQImkot2IbWm/l2Xc4d2xsFW2/hyxyB0HjCVyg28lvulyGY8zwddNC
         KpIW9pGv35GQA==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id A7BF2A00E5;
        Fri, 30 Jul 2021 06:34:04 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7358C8014B;
        Fri, 30 Jul 2021 06:33:56 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="iPKyzY8v";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfWjVC+ngj45C48Os+isXfBFx1wV9HHgU0AWmjBOx/9U5+bcR4M6vkYGpzhgOj9Ch0nsHPlVGpPi2aNVJ1qcNkOhuC6CBsNIyn6ct0ZV8/nY5RVff55Eycs9kGDCWv973PHshfa/JPnsXFlItn4NC2aqsKQGeM5D4HqQWzpudlcrZI2IgX/7la+MAKb2teZGXc2ds3Y8DCitWXhQG3D1J6n/xZMgeh8cGkBNyqViKyffnvoROCeayz989rjFHaR3XAj/UxeAcEfKNdojZ/bekSFyOFC+cWCgK9tJ4q3qTABVo8Uta9c4trGivoYmg0SpCwwZJbsHU1Ix1NpFTTETgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyyEkF8QLfzLd0aJhIU3cmCjcYDP/eXNiTevrsMXebc=;
 b=lPHWP7QNmzzR1d7QmivnyTvavaA7/13kNrm81McDQGP6CEPN9+94BEhe1/d4+Qz9wxaWXooDMJdybk4WxOZpuQtcGl2dc3Geb5bUkRdRiA0IQch5mbcsoU/7WrjFsfiz75F1lESy8E5wSf449rI6NfX6f1dhZ7NWS2aBvNGFEMu0OSDTW06vi75Df9TlxJf7P/PWOgBGCdiKDZHkuKlNVn/69XA1cCfFilf35ZaNJf4nOCZQiFYto2LR8tyPuw6Qp7xfdiKxvuyIl0rYq1iCZo+5i7Xu4y4YhGYi0uBYijfO9RdfYrFXoG8V6v/NOxLq/YQiCo9GrZC9Y1PAZheEcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyyEkF8QLfzLd0aJhIU3cmCjcYDP/eXNiTevrsMXebc=;
 b=iPKyzY8vZOr/q+TQ0/9M/AXZcHwO0roDsgkf79e0JcTbjENYIH/N0n4ASz9EcdNatxOO15/GScJ2E5vdAqSfbZeI0SteRTCpLJWLEIu2domqxEUFviNja6MqmZK/oWq5GAGQbF4sr+Syu2e6QjVUHu24Rb1rbxAlK+rLEJ/r0Tg=
Received: from DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12)
 by DM8PR12MB5432.namprd12.prod.outlook.com (2603:10b6:8:32::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Fri, 30 Jul
 2021 06:33:55 +0000
Received: from DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4]) by DM4PR12MB5390.namprd12.prod.outlook.com
 ([fe80::d97c:7079:8a93:cd4%3]) with mapi id 15.20.4352.032; Fri, 30 Jul 2021
 06:33:55 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "paul@crapouillou.net" <paul@crapouillou.net>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dongsheng.qiu@ingenic.com" <dongsheng.qiu@ingenic.com>,
        "aric.pzqi@ingenic.com" <aric.pzqi@ingenic.com>,
        "rick.tyliu@ingenic.com" <rick.tyliu@ingenic.com>,
        "sihui.liu@ingenic.com" <sihui.liu@ingenic.com>,
        "jun.jiang@ingenic.com" <jun.jiang@ingenic.com>,
        "sernia.zhou@foxmail.com" <sernia.zhou@foxmail.com>,
        =?utf-8?B?RHJhZ2FuIMSMZcSNYXZhYw==?= <dragancecavac@yahoo.com>
Subject: Re: [PATCH 2/2] USB: dwc2: Add OTG support for Ingenic SoCs.
Thread-Topic: [PATCH 2/2] USB: dwc2: Add OTG support for Ingenic SoCs.
Thread-Index: AQHXgGjSnOkEfMPO4UOGXqJsuHct+KtbGOoA
Date:   Fri, 30 Jul 2021 06:33:55 +0000
Message-ID: <2ad5780a-bce9-1dc9-3cd8-8b78f4c0a61b@synopsys.com>
References: <1627116521-124612-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1627116521-124612-3-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To: <1627116521-124612-3-git-send-email-zhouyanjie@wanyeetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
authentication-results: wanyeetech.com; dkim=none (message not signed)
 header.d=none;wanyeetech.com; dmarc=none action=none
 header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cae68505-d3da-49de-2e5e-08d95324012d
x-ms-traffictypediagnostic: DM8PR12MB5432:
x-microsoft-antispam-prvs: <DM8PR12MB54322887401018952A961311A7EC9@DM8PR12MB5432.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1yT8fYZoNKmmwbw5Zsuz60M3xS6vBjx2LLBaa1Eff1vCLvu2XKItOfg7wteQ6vjULvnz4QSdr8TzwBWJ5zohPCBQTxRzLCRn3sdiPP035dNUJ99vhxL97KDW5YDoLrgHW+wqy4O3GQ7x33ou9mOID8bD2EcAX3Ns1EsMn2bW9XR2a/ALKLNFTKd7SbUhltG5NEqSQoBE46ayqw9FeVB9YPlI7+7lDE21pMXJcwKCjtL5AJL6q2m1ZLtr6nc8TwM3h48e3F4qa1yRdWrU++KYRXhPoMcLLwYc55/3v4S+tMt/gvhIIqmCPltMAIJYoVI0MLCiScwdBNQBY26hBmi9EhpSZ6jz/HsJtLcX7iKz6ugtSTCVOkL77c1QKBYjY+ascrHMVVuS3BrGjbv4Dg+sO2Iuu7VWJGu5uCXaO0e1loUqQpn0CQqvFkIjuaJUZqfZ8fmQyuitOa99fGJkOuTxpMaB1W1JLeJAHFWsFXtJ7SIGD3kbY11JQGoD5rpqljlTOUkS6uT/WvwmUbSmMv2xVoUtapBc6Ne5GcTL7p8zk4AR3JkWVhUKQPP4soAoLgpqWFhJYVzbJC32/XyU8qwSFB2W1VNXrW3P1Yl6iZTRZU906tBoLkwED+KjKcyX8HlgCVU4LT40I9Cg9SrTfHGMzNY2ZOJcxsOK4dzhLD+t6tHz6QQFhe60An1X0t4VWvhGXxodo9va8R3Phkr7xNaEOOjlDMflIxJdRsajkMqInPbx17O0crZ/VdM5O9uwAkhG6SpsuU38puqiz45gx3CyQg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(6029001)(346002)(396003)(376002)(366004)(39860400002)(136003)(8936002)(53546011)(71200400001)(6512007)(2616005)(4326008)(122000001)(7416002)(2906002)(6506007)(5660300002)(38100700002)(83380400001)(31686004)(66946007)(54906003)(76116006)(66556008)(66476007)(66574015)(6486002)(91956017)(316002)(110136005)(66446008)(64756008)(38070700005)(478600001)(186003)(36756003)(8676002)(86362001)(31696002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzVEUTAzc3RoQ25UeXVIK0pvS0R0YVlPL2VLamFZbWtpbWRZWjhTY0lKQlEx?=
 =?utf-8?B?c293SEtDMG1veHp3NDVKZythSXlzcVJSOWhkci9uWUR5b0xheHNIaFBEaGNy?=
 =?utf-8?B?UGRPVngvNGZIK2dQRk43b0pIK01vbmd6dWM1WjdEbjZqWnQ2TmFya3oyN1Z2?=
 =?utf-8?B?b2J1d3luR2Z2eHFZK21MRXJtMWJjWGNYVU40a2Z6c2QvVUZHcTJ5SGQwZUZD?=
 =?utf-8?B?MnNOSGhVaEdaVFN6MzU1K0FNTFZTSlRNU3lFQjQvUGRBbGJ4WGRqRkovVzkz?=
 =?utf-8?B?cWZsWmtEMFZTNGg1VExzaVFYaXJudFBmaUxLVTNaZU9vSVIyUDBub20yNk9h?=
 =?utf-8?B?RUFYMVA4Qmx0TWlOSkl0K2Z1enRxVnFaUGIvcFU4dW9DTW4yYjBSRktyS1Jx?=
 =?utf-8?B?UWdYRktpdUNhWHMvNHRKSDN1a3BRUUxaZ0pUUXZHY0ducVZNbjN5ai9idi9J?=
 =?utf-8?B?N1M4OGVhZzVZUFZJTmtQWnhHZFBPWlp2d2Q3Qys4MzFnQWg0OUNmKzcyMEZ0?=
 =?utf-8?B?anRXcHQ0MysvaURvUGJwL3BYeHE0RjdwdytqNWlLSlo4cWVuSHMvWEladHFt?=
 =?utf-8?B?d3VTckd0MjVXS1hqQWlGRTdIYkh4UWJ2bisrZTBnSHJoSHFPcFRjU2Y0R2ZG?=
 =?utf-8?B?S2xSS1pjRmJaQkl3VGpPVCtJempWQy9XeG4yMUxaMFppdVJpb2UwQmtQcVN3?=
 =?utf-8?B?WGt1ekJldjR6SnlWenN0bzlaODhMVmF1UVFYdGJEa2FlcG11cXE0cUZacTJr?=
 =?utf-8?B?WHZacEdXeFdiSGppQmVFTG1xcTBnRVhKd2xTQ1VXZWZWT0R3RW50QWpIZEEz?=
 =?utf-8?B?Ym1HT2F1akdzbmdLLzI5Q3h0VGhXZDFDRFdFUCt0UXRzcW5tTTNyTFZmTHNy?=
 =?utf-8?B?QXE4MzZzTW1TRFNycWIwT3ZKMmx6MUFuNUw4WjQvWkdRUEg1d2tJRGJ2andW?=
 =?utf-8?B?TFQ5bU04QXFpUXFHZGJmbzNNU0ppbGdsUHVVTTdRakprOE14SEZtcmpVaXA5?=
 =?utf-8?B?N2JmYTNJWlUrTnptQXlSNWdEQlkwcVFja2lsdXdIZHhFTzJqaWdFYkNlNUc3?=
 =?utf-8?B?ZnFNdW5BeEZwT1lXb2w4ZHVSVEpBYWJMNXM4QlYzNkNuMWprdjcvdmZsb2xM?=
 =?utf-8?B?MWt1a2VoRTV5K2JnMm1yZzJZLzBPa3oxY2pSbndpb0t2VU01RFJRdVcrOUhG?=
 =?utf-8?B?NXFGZWtMeFhLbkhrTDNBcXlneEZmUnNXY0RncGtsOWREckFTdGkxL2JxWjJZ?=
 =?utf-8?B?RHJTL21UUXNwTDczczN4cjdlclRiR0duZHE2RTEyZWgyYlN5eUVBK1R2V2Yx?=
 =?utf-8?B?YXpWelhjM0dGZTZCak96ZSt1dWdVVDZ0ZmhLM2UzdmYyMjRmem1jOGlFbjZR?=
 =?utf-8?B?WUJreUxaSTdsWFJvV041SjB0K0pRV0IraHFLS3lLU25UbVhQNDFhTURST1gv?=
 =?utf-8?B?a0hIcEplYkJQT200K1FLeGhJUEJNWGZsN21lSjZ3ZEdqS055TmFzbGl0UmJY?=
 =?utf-8?B?TjZLc0E1WWFmZHN6dkZJMlFrYXorUG50MXRYQ3laRnJsdVNwbEYreGNMVU8r?=
 =?utf-8?B?SnQ5MDNzU1R4U1ZTaTZaV0Rrek9BTEV0NDVjV3kzMmRYVkhjRGtOWEpVVHpV?=
 =?utf-8?B?Yzkrbjl3RGJjUDhFMEdkbVNOUnBVZXczSTZldVEyS0dPeGU5aGZGa2ZHWVNr?=
 =?utf-8?B?SW5NSytvT3RoMDcyQ0FQdUpSRGxWSTYyK0xjaU4yMVZCTlBHaUhjN0lCWjBk?=
 =?utf-8?Q?5/gt9Ao4qADxRf2qjc=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB1BAE2875AAD843B1E7474B221721A3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cae68505-d3da-49de-2e5e-08d95324012d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2021 06:33:55.2266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E/Hpo0GkG9LdcrRsqkCPipvCZ7Eh+YFXLU5/nkqfqowlHTrPqK7hv2gWNn7rnb1+ccU+yLW0pdEFOENDaN5G+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5432
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gNy8yNC8yMDIxIDEyOjQ4IFBNLCDlkajnkLDmnbAgKFpob3UgWWFuamllKSB3cm90ZToNCj4g
QWRkIE9URyBzdXBwb3J0IGZvciB0aGUgSlo0Nzc1IFNvQywgdGhlIEpaNDc4MCBTb0MsIHRoZSBY
MTAwMA0KPiBTb0MsIHRoZSBYMTYwMCBTb0MsIHRoZSBYMTgzMCBTb0MsIGFuZCB0aGUgWDIwMDAg
U29DLiBJbnRyb2R1Y2UNCj4gc3VwcG9ydCBmb3IgZGlzYWJsZSBJbmdlbmljIG92ZXJjdXJyZW50
IGRldGVjdGlvbiwgb25jZSBzZWxlY3RlZA0KPiBpdCBlbmFibGVzIEdPVEdDVEwgcmVnaXN0ZXIg
Yml0cyBWYnZhbGlkT3ZFbiBhbmQgVmJ2YWxpZE92VmFsIHRvDQo+IGRpc2FibGUgdGhlIFZCVVMg
b3ZlcmN1cnJlbnQgZGV0ZWN0aW9uLg0KPiANCj4gVGhpcyBwYXRjaCBpcyBkZXJpdmVkIGZyb20g
RHJhZ2FuIMSMZcSNYXZhYyAoaW4gdGhlIGtlcm5lbCAzLjE4LjMNCj4gdHJlZSBvZiBDSTIwKS4g
SXQgaXMgdmVyeSB1c2VmdWwgZm9yIHRoZSBNSVBTIENyZWF0b3IgQ0kyMCAocjEpLg0KPiBXaXRo
b3V0IHRoaXMgcGF0Y2gsIE9URyBwb3J0IG9mIENJMjAgaGFzIGEgZ3JlYXQgcHJvYmFiaWxpdHkg
dG8NCj4gZmFjZSBvdmVyY3VycmVudCB3YXJuaW5nLCB3aGljaCBicmVha3MgdGhlIE9URyBmdW5j
dGlvbmFsaXR5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRHJhZ2FuIMSMZcSNYXZhYyA8ZHJhZ2Fu
Y2VjYXZhY0B5YWhvby5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IOWRqOeQsOadsCAoWmhvdSBZYW5q
aWUpIDx6aG91eWFuamllQHdhbnllZXRlY2guY29tPg0KDQpBY2tlZC1ieTogTWluYXMgSGFydXR5
dW55YW4gPE1pbmFzLkhhcnV0eXVueWFuQHN5bm9wc3lzLmNvbT4NCg0KPiAtLS0NCj4gICBkcml2
ZXJzL3VzYi9kd2MyL2NvcmUuYyAgIHwgIDkgKysrKysrKysrDQo+ICAgZHJpdmVycy91c2IvZHdj
Mi9jb3JlLmggICB8ICA1ICsrKysrDQo+ICAgZHJpdmVycy91c2IvZHdjMi9wYXJhbXMuYyB8IDQ5
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+ICAgMyBm
aWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMi9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MyL2NvcmUu
Yw0KPiBpbmRleCAyNzJhZTU3Li5jMzViMmUyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9k
d2MyL2NvcmUuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MyL2NvcmUuYw0KPiBAQCAtMTE1Myw2
ICsxMTUzLDcgQEAgc3RhdGljIHZvaWQgZHdjMl9zZXRfdHVybmFyb3VuZF90aW1lKHN0cnVjdCBk
d2MyX2hzb3RnICpoc290ZykNCj4gICBpbnQgZHdjMl9waHlfaW5pdChzdHJ1Y3QgZHdjMl9oc290
ZyAqaHNvdGcsIGJvb2wgc2VsZWN0X3BoeSkNCj4gICB7DQo+ICAgCXUzMiB1c2JjZmc7DQo+ICsJ
dTMyIG90Z2N0bDsNCj4gICAJaW50IHJldHZhbCA9IDA7DQo+ICAgDQo+ICAgCWlmICgoaHNvdGct
PnBhcmFtcy5zcGVlZCA9PSBEV0MyX1NQRUVEX1BBUkFNX0ZVTEwgfHwNCj4gQEAgLTExODcsNiAr
MTE4OCwxNCBAQCBpbnQgZHdjMl9waHlfaW5pdChzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcsIGJv
b2wgc2VsZWN0X3BoeSkNCj4gICAJCWR3YzJfd3JpdGVsKGhzb3RnLCB1c2JjZmcsIEdVU0JDRkcp
Ow0KPiAgIAl9DQo+ICAgDQo+ICsJaWYgKGhzb3RnLT5wYXJhbXMuZGVhY3RpdmF0ZV9pbmdlbmlj
X292ZXJjdXJyZW50X2RldGVjdGlvbikgew0KPiArCQlpZiAoZHdjMl9pc19ob3N0X21vZGUoaHNv
dGcpKSB7DQo+ICsJCQlvdGdjdGwgPSByZWFkbChoc290Zy0+cmVncyArIEdPVEdDVEwpOw0KPiAr
CQkJb3RnY3RsIHw9IEdPVEdDVExfVkJWQUxPRU4gfCBHT1RHQ1RMX1ZCVkFMT1ZBTDsNCj4gKwkJ
CXdyaXRlbChvdGdjdGwsIGhzb3RnLT5yZWdzICsgR09UR0NUTCk7DQo+ICsJCX0NCj4gKwl9DQo+
ICsNCj4gICAJcmV0dXJuIHJldHZhbDsNCj4gICB9DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9kd2MyL2NvcmUuaCBiL2RyaXZlcnMvdXNiL2R3YzIvY29yZS5oDQo+IGluZGV4IGFi
NmI4MTUuLmUwMjZkMTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvY29yZS5oDQo+
ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzIvY29yZS5oDQo+IEBAIC00MTgsNiArNDE4LDEwIEBAIGVu
dW0gZHdjMl9lcDBfc3RhdGUgew0KPiAgICAqCQkJZGV0ZWN0aW9uIHVzaW5nIEdHUElPIHJlZ2lz
dGVyLg0KPiAgICAqCQkJMCAtIERlYWN0aXZhdGUgdGhlIGV4dGVybmFsIGxldmVsIGRldGVjdGlv
biAoZGVmYXVsdCkNCj4gICAgKgkJCTEgLSBBY3RpdmF0ZSB0aGUgZXh0ZXJuYWwgbGV2ZWwgZGV0
ZWN0aW9uDQo+ICsgKiBAZGVhY3RpdmF0ZV9pbmdlbmljX292ZXJjdXJyZW50X2RldGVjdGlvbjog
RGVhY3RpdmF0ZSBJbmdlbmljIG92ZXJjdXJyZW50DQo+ICsgKgkJCWRldGVjdGlvbi4NCj4gKyAq
CQkJMCAtIEFjdGl2YXRlIHRoZSBvdmVyY3VycmVudCBkZXRlY3Rpb24gKGRlZmF1bHQpDQo+ICsg
KgkJCTEgLSBEZWFjdGl2YXRlIHRoZSBvdmVyY3VycmVudCBkZXRlY3Rpb24NCj4gICAgKiBAZ19k
bWE6ICAgICAgICAgICAgICBFbmFibGVzIGdhZGdldCBkbWEgdXNhZ2UgKGRlZmF1bHQ6IGF1dG9k
ZXRlY3QpLg0KPiAgICAqIEBnX2RtYV9kZXNjOiAgICAgICAgIEVuYWJsZXMgZ2FkZ2V0IGRlc2Ny
aXB0b3IgRE1BIChkZWZhdWx0OiBhdXRvZGV0ZWN0KS4NCj4gICAgKiBAZ19yeF9maWZvX3NpemU6
CVRoZSBwZXJpb2RpYyByeCBmaWZvIHNpemUgZm9yIHRoZSBkZXZpY2UsIGluDQo+IEBAIC00ODks
NiArNDkzLDcgQEAgc3RydWN0IGR3YzJfY29yZV9wYXJhbXMgew0KPiAgIAl1OCBoaXJkX3RocmVz
aG9sZDsNCj4gICAJYm9vbCBhY3RpdmF0ZV9zdG1fZnNfdHJhbnNjZWl2ZXI7DQo+ICAgCWJvb2wg
YWN0aXZhdGVfc3RtX2lkX3ZiX2RldGVjdGlvbjsNCj4gKwlib29sIGRlYWN0aXZhdGVfaW5nZW5p
Y19vdmVyY3VycmVudF9kZXRlY3Rpb247DQo+ICAgCWJvb2wgaXBnX2lzb2NfZW47DQo+ICAgCXUx
NiBtYXhfcGFja2V0X2NvdW50Ow0KPiAgIAl1MzIgbWF4X3RyYW5zZmVyX3NpemU7DQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9kd2MyL3BhcmFtcy5jIGIvZHJpdmVycy91c2IvZHdjMi9wYXJh
bXMuYw0KPiBpbmRleCA2N2M1ZWIxLi5hN2ExYjUwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3Vz
Yi9kd2MyL3BhcmFtcy5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzIvcGFyYW1zLmMNCj4gQEAg
LTcxLDYgKzcxLDQ3IEBAIHN0YXRpYyB2b2lkIGR3YzJfc2V0X2hpc19wYXJhbXMoc3RydWN0IGR3
YzJfaHNvdGcgKmhzb3RnKQ0KPiAgIAlwLT5wb3dlcl9kb3duID0gRFdDMl9QT1dFUl9ET1dOX1BB
UkFNX05PTkU7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIHZvaWQgZHdjMl9zZXRfano0Nzc1X3Bh
cmFtcyhzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcpDQo+ICt7DQo+ICsJc3RydWN0IGR3YzJfY29y
ZV9wYXJhbXMgKnAgPSAmaHNvdGctPnBhcmFtczsNCj4gKw0KPiArCXAtPm90Z19jYXAgPSBEV0My
X0NBUF9QQVJBTV9OT19ITlBfU1JQX0NBUEFCTEU7DQo+ICsJcC0+c3BlZWQgPSBEV0MyX1NQRUVE
X1BBUkFNX0hJR0g7DQo+ICsJcC0+cGh5X3R5cGUgPSBEV0MyX1BIWV9UWVBFX1BBUkFNX1VUTUk7
DQo+ICsJcC0+cGh5X3V0bWlfd2lkdGggPSAxNjsNCj4gKwlwLT5kZWFjdGl2YXRlX2luZ2VuaWNf
b3ZlcmN1cnJlbnRfZGV0ZWN0aW9uID0NCj4gKwkJZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbCho
c290Zy0+ZGV2LCAiZGlzYWJsZS1vdmVyLWN1cnJlbnQiKTsNCj4gK30NCj4gKw0KPiArc3RhdGlj
IHZvaWQgZHdjMl9zZXRfeDE2MDBfcGFyYW1zKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykNCj4g
K3sNCj4gKwlzdHJ1Y3QgZHdjMl9jb3JlX3BhcmFtcyAqcCA9ICZoc290Zy0+cGFyYW1zOw0KPiAr
DQo+ICsJcC0+b3RnX2NhcCA9IERXQzJfQ0FQX1BBUkFNX05PX0hOUF9TUlBfQ0FQQUJMRTsNCj4g
KwlwLT5zcGVlZCA9IERXQzJfU1BFRURfUEFSQU1fSElHSDsNCj4gKwlwLT5ob3N0X2NoYW5uZWxz
ID0gMTY7DQo+ICsJcC0+cGh5X3R5cGUgPSBEV0MyX1BIWV9UWVBFX1BBUkFNX1VUTUk7DQo+ICsJ
cC0+cGh5X3V0bWlfd2lkdGggPSAxNjsNCj4gKwlwLT5kZWFjdGl2YXRlX2luZ2VuaWNfb3ZlcmN1
cnJlbnRfZGV0ZWN0aW9uID0NCj4gKwkJZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbChoc290Zy0+
ZGV2LCAiZGlzYWJsZS1vdmVyLWN1cnJlbnQiKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQg
ZHdjMl9zZXRfeDIwMDBfcGFyYW1zKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykNCj4gK3sNCj4g
KwlzdHJ1Y3QgZHdjMl9jb3JlX3BhcmFtcyAqcCA9ICZoc290Zy0+cGFyYW1zOw0KPiArDQo+ICsJ
cC0+b3RnX2NhcCA9IERXQzJfQ0FQX1BBUkFNX05PX0hOUF9TUlBfQ0FQQUJMRTsNCj4gKwlwLT5z
cGVlZCA9IERXQzJfU1BFRURfUEFSQU1fSElHSDsNCj4gKwlwLT5ob3N0X3J4X2ZpZm9fc2l6ZSA9
IDEwMjQ7DQo+ICsJcC0+aG9zdF9ucGVyaW9fdHhfZmlmb19zaXplID0gMTAyNDsNCj4gKwlwLT5o
b3N0X3BlcmlvX3R4X2ZpZm9fc2l6ZSA9IDEwMjQ7DQo+ICsJcC0+aG9zdF9jaGFubmVscyA9IDE2
Ow0KPiArCXAtPnBoeV90eXBlID0gRFdDMl9QSFlfVFlQRV9QQVJBTV9VVE1JOw0KPiArCXAtPnBo
eV91dG1pX3dpZHRoID0gMTY7DQo+ICsJcC0+ZGVhY3RpdmF0ZV9pbmdlbmljX292ZXJjdXJyZW50
X2RldGVjdGlvbiA9DQo+ICsJCWRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woaHNvdGctPmRldiwg
ImRpc2FibGUtb3Zlci1jdXJyZW50Iik7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgdm9pZCBkd2My
X3NldF9zM2M2NDAwX3BhcmFtcyhzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcpDQo+ICAgew0KPiAg
IAlzdHJ1Y3QgZHdjMl9jb3JlX3BhcmFtcyAqcCA9ICZoc290Zy0+cGFyYW1zOw0KPiBAQCAtMjAy
LDcgKzI0MywxMyBAQCBzdGF0aWMgdm9pZCBkd2MyX3NldF9zdG0zMm1wMTVfaHNvdGdfcGFyYW1z
KHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykNCj4gICANCj4gICBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIGR3YzJfb2ZfbWF0Y2hfdGFibGVbXSA9IHsNCj4gICAJeyAuY29tcGF0aWJsZSA9ICJi
cmNtLGJjbTI4MzUtdXNiIiwgLmRhdGEgPSBkd2MyX3NldF9iY21fcGFyYW1zIH0sDQo+IC0JeyAu
Y29tcGF0aWJsZSA9ICJoaXNpbGljb24saGk2MjIwLXVzYiIsIC5kYXRhID0gZHdjMl9zZXRfaGlz
X3BhcmFtcyAgfSwNCj4gKwl7IC5jb21wYXRpYmxlID0gImhpc2lsaWNvbixoaTYyMjAtdXNiIiwg
LmRhdGEgPSBkd2MyX3NldF9oaXNfcGFyYW1zIH0sDQo+ICsJeyAuY29tcGF0aWJsZSA9ICJpbmdl
bmljLGp6NDc3NS1vdGciLCAuZGF0YSA9IGR3YzJfc2V0X2p6NDc3NV9wYXJhbXMgfSwNCj4gKwl7
IC5jb21wYXRpYmxlID0gImluZ2VuaWMsano0NzgwLW90ZyIsIC5kYXRhID0gZHdjMl9zZXRfano0
Nzc1X3BhcmFtcyB9LA0KPiArCXsgLmNvbXBhdGlibGUgPSAiaW5nZW5pYyx4MTAwMC1vdGciLCAu
ZGF0YSA9IGR3YzJfc2V0X2p6NDc3NV9wYXJhbXMgfSwNCj4gKwl7IC5jb21wYXRpYmxlID0gImlu
Z2VuaWMseDE2MDAtb3RnIiwgLmRhdGEgPSBkd2MyX3NldF94MTYwMF9wYXJhbXMgfSwNCj4gKwl7
IC5jb21wYXRpYmxlID0gImluZ2VuaWMseDE4MzAtb3RnIiwgLmRhdGEgPSBkd2MyX3NldF94MTYw
MF9wYXJhbXMgfSwNCj4gKwl7IC5jb21wYXRpYmxlID0gImluZ2VuaWMseDIwMDAtb3RnIiwgLmRh
dGEgPSBkd2MyX3NldF94MjAwMF9wYXJhbXMgfSwNCj4gICAJeyAuY29tcGF0aWJsZSA9ICJyb2Nr
Y2hpcCxyazMwNjYtdXNiIiwgLmRhdGEgPSBkd2MyX3NldF9ya19wYXJhbXMgfSwNCj4gICAJeyAu
Y29tcGF0aWJsZSA9ICJsYW50aXEsYXJ4MTAwLXVzYiIsIC5kYXRhID0gZHdjMl9zZXRfbHRxX3Bh
cmFtcyB9LA0KPiAgIAl7IC5jb21wYXRpYmxlID0gImxhbnRpcSx4cngyMDAtdXNiIiwgLmRhdGEg
PSBkd2MyX3NldF9sdHFfcGFyYW1zIH0sDQo+IA0KDQo=

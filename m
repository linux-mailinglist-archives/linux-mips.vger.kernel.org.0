Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C65C8772A43
	for <lists+linux-mips@lfdr.de>; Mon,  7 Aug 2023 18:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbjHGQNs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Aug 2023 12:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjHGQNr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Aug 2023 12:13:47 -0400
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2082.outbound.protection.outlook.com [40.107.12.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58ACF10C0;
        Mon,  7 Aug 2023 09:13:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odsBiTmhtHeiPv6WmoM7/P/He7wS83xVcFPWIXhvDSk2nJSM3A9wGVT+mSrbPPgvf+/V8XFKxN5gZ3vawPDLrXdwJ1WLOBsAZzvxmncxqvo7dIZABDUH1eyyhkkvaDXT9g7CWnFIKTQ6+TwPDWYj1Vj7/M3acsbozBH7wMAD1fNvailBqNEzLiGaNEe0Y6gPWCcO9FroMHF1zAyybMHhWBKX7mWd+mH4/zp9lyAJFIYm/grygRQzDwaNiodFx0HqGAHenlJcpFG+qbFBm1ptFpoRWwp1TnTRpxpxuMVWu9TBPFK0jEesfcBea0NvysWJDMBIA4nqOAJatnUTwHuSAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSfrXTJ2hVLqU8vXHlZrcFcojA0hmNjbVGkszWhHmEE=;
 b=Q8ys+lPire5AsgqpV+viQStSzcLsJZnpRfee9VPtiFO2ixFUC47RICZM0NGHj3TGWzULgF3jVprJG5igNEMylSD5rON7g6lgVWfRlFrdQJv7R9GxzL0bnYAH1GgTFZv+/b/aMKPcW/vfVvJS+uEr6dlbHCpE33NlMQbmD6pXwHJhkRBNdrjXGo9yHi+uzXb6W6BKfNVibUoMz5F8RRbuleGS4pGUu3k6cVGMJixLlG5fHZl3wnmzJLvKp+jHUGT5BI0+ANXppJvmFkzUGmb5VWpK4/fP6ZDIaXuqisfYY3TkCFlXCbAHi6f3kErek4POK6z0V4wgizUgSYy2QWu4Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSfrXTJ2hVLqU8vXHlZrcFcojA0hmNjbVGkszWhHmEE=;
 b=Pks4ZJYDL97hDBAjC3k0bHs+X7jcFEpW07hTdFTjVvUbQzo34tUpZEPrVn8CKmUZBuXEKk4L0XVfSZW4ltlR9hgNbre0DJwrV0VXT5xkNrP2uZRcIFtsnz/u1GUOP0wtREVbfQC1iw+q8w5LUsul/64p8cQpJVkHgo56r8o0mJBjO39KuGKeSj/3YGQmNdGXHN+21Ww6JjkTiHp0lCJQw0a9k4B5k1KLzOGRZkjGepc6gV7IPG9K7uZ/gYiIvULkcrgwrE1hgUYEnek3dlVj2wLs7y7iMP/2rH709/+GvVwVJgb/0z7duTcYeQ0t6lxhV7cCjVCowfzHcX0sqVMWWA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3373.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 16:13:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%6]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 16:13:41 +0000
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
To:     Uros Bizjak <ubizjak@gmail.com>,
        "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Jun Yi <yijun@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] locking/arch: Rewrite local_add_unless as static inline
 function
Thread-Topic: [PATCH] locking/arch: Rewrite local_add_unless as static inline
 function
Thread-Index: AQHZw4tRBaYHx01VL0yvL0yXDRQ/a6/fDSyA
Date:   Mon, 7 Aug 2023 16:13:41 +0000
Message-ID: <4d4dd1e8-042a-561a-4ffc-529638cb0780@csgroup.eu>
References: <20230731084458.28096-1-ubizjak@gmail.com>
In-Reply-To: <20230731084458.28096-1-ubizjak@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3373:EE_
x-ms-office365-filtering-correlation-id: 7b1881e0-f414-4f48-268a-08db97614457
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z8cjxA/nk3+nyqKr8P9ORx49DRabqpWticRy0SOfx98xMmCzj2MD6Ecmbz/VP1JJvQHNC0gIGley4J3nwK6eQvEG6MNJrKFN5A+baTgoYYib4W2vVFqiL7kfwJ26WtEipaqwX5QDPIsE+HCyXABmcUTYK9UWhQLSxuTvuVhiSBx8vQ5MKbGK1HTxwhpkL4PN03LBh4gvErL5D9fIGb4fAaugwzFzhM6Zd9I3+LGIgjH5IP4PvjGkXj81+pu7saAIYSudCvD5TQ+Wg3ElKwM7MWGt6KB/y/kiJxHBt1js1gwZfTHKCTAqn2QHKah6BmpWRRW3pIxPJIpkbK9H8QqdshWpWa4gEzrXbcHyEDKDYQp1sbmumzKw/7N1REkUrYAj7y5j7ijJO3SM5rAIUzaU9o0SdI2T6VRrUksivLOj1urNlQ86zw5Fv6+mJo7R6gRCfJ0ZcHJMFmgn8SB4Cd/6MotNlZVBsiHSI+ALLmayHVNpZnvQTdjA+r6T7bnz6AMFSYubLWy5eh/slbqW+Xj53hbMtNAjiqsZcpgoduIjkvGXk69Tn8snutgWIi0XdSoTuNgD1E5stclC2WkLAfwC10xwYPlHobUsBlqNvyKl4Qe3AFFnm2YR4aw/2ZnrZPIuQjp0bzOUzpmrgvKy6M0c4hlNKvY/BJhgOvfP9fBfQncu8KEAzRBFbOBWHNuUOdyP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(376002)(136003)(346002)(366004)(396003)(451199021)(1800799003)(186006)(6512007)(26005)(6506007)(36756003)(54906003)(110136005)(38100700002)(44832011)(5660300002)(7416002)(38070700005)(86362001)(31696002)(4326008)(2906002)(66946007)(91956017)(64756008)(66556008)(76116006)(66476007)(41300700001)(66446008)(8936002)(8676002)(316002)(71200400001)(122000001)(478600001)(2616005)(66574015)(6486002)(31686004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0E4MXVhTFpBVExLUzM3cDFGRExSSHlIYWVNOEUzb3hVVVgyTmRlN3U2dEZ3?=
 =?utf-8?B?RWJhTU95TWxQNWd2QlhPTUJyN2I1d2FoNFZUMmQwOXFwT3Z0d1JSWWxRb3VB?=
 =?utf-8?B?dWt6eCtVUEdwamoyL0NLMTVVMXFMUzkrc0VlSmV3MTE3eFN3SjFSMWVOZTlV?=
 =?utf-8?B?OHdhZ0NDMVNVV2QxZnZYTVRDY2RQbFAvdi8ycFo4alFmbG5ITGdBb2Q0SkNa?=
 =?utf-8?B?KzNRVTBFTnJUbERTd3VMZDJRVHFtRUUrWlYzZndoN1lwME84YzBZZjl6dkIz?=
 =?utf-8?B?OC95WHdtbVlTMENjN3ZTVVZpTytyMXdma0lSTXNzQkFQTERieitYT29zUGd2?=
 =?utf-8?B?a09TSElwRDJzZXNlVHl3NVpxNXN4WGtMK1M4QXVvL01JaERKNnJBN1QrMVNw?=
 =?utf-8?B?REJleXZ3ZTlIK2ROd3VRZk1YdGpxNFlVK2xSMjNaWEdCM1dERFJPTmpiUTF1?=
 =?utf-8?B?OVVPaXdaeXdIcDFYMEhRdXVxRFRwWU9uVUpwZjFqeGdQRUdySHY4TVl4cmxM?=
 =?utf-8?B?cnRCd0xpMkdyMnlRMnZiQTBoSFNIQzBGSkhJQWp6WXNwWGFTd3Y4RG45Ymgx?=
 =?utf-8?B?bnZwMm1YS3BCZG5QVGFKUURiYys1aUhJczVlNWxhNnIyMkE2dFVxaDB0T3JO?=
 =?utf-8?B?QU1COGl5OHEwN1FBRUNCN09EWDZDWkF4QUJYRkQ3K3prRGZHU0hWaVViQnEx?=
 =?utf-8?B?OFdhUEl0UnZRcFNBWE45L3dXV0w5S3h1eGh1YzV1RFpjbkNVbTlLVkhkRGN3?=
 =?utf-8?B?dHhaVHI5bitnR1N5QU0wdTFBVVZuU0dXdkJXSUpWMy9GZW5QbzR0RGtMMUhN?=
 =?utf-8?B?SU5QN0huWXRHRTlSMnNvamRqUWkxMHJqQXNRODNuMVBRQ1JHWlhmUXhUNDJT?=
 =?utf-8?B?Q3RKRUUycitWTnBTYkkwY09yVkFKRVVuZjdsSDMraUN5MERYbjIzaEFsVkJW?=
 =?utf-8?B?S3E3SHRpVlpDeDYrUlE2b3IyNkxCNTAwVEVDbVpmSVUxeVluV3dpNkNCTFJJ?=
 =?utf-8?B?ZHVLcERkMk1nb0pCZGIzVGxtcjhGeHBjcGpKaUFTVWtaVE80dmJHYkpBV0Z1?=
 =?utf-8?B?T3ZoV3ZwUmFwbllKOERlWGNQWkNXRmlsTW5EdFlKL1AyWm45MHdtSXBmRDNH?=
 =?utf-8?B?K1FsL0JZaGxUMzEzYjRhQ1BOdkNTNkd5RHlOalhrUnJXdGJSYk5FSHhVNjln?=
 =?utf-8?B?TFNNWmFxZHNiMXlQci8wVkJZUm0yZGdoQ1M3eFFHNk9WTnJjR1lFem85TWJ6?=
 =?utf-8?B?b09KVEhWWkNCZnMydkM1SE9Ya2tic3d6YWVvODZ2bVUreGUzbnhWMlVqWUZx?=
 =?utf-8?B?WXJpR2hpU0pDYURtanY1UHJILzlKY0tYeE5LNEk4LzgrV0I0blFGMXQ3VHJ5?=
 =?utf-8?B?THhxNkZGTHJGODhJM2hSU1JpM2dGYlNpWWhpRzBtVTNFOHdFdFRZbFQ1SGxC?=
 =?utf-8?B?Y3E4ZDQycGJqUWdzbUc0dXllZHFtN05MU29qekhHa1FoenhrOHArTTlCbUZz?=
 =?utf-8?B?WEdES0xOaXlqNURxRGZ5SDM5VC91L2NpSVZiRndMVWgwYnYwdklBS1I1YUZD?=
 =?utf-8?B?WFRpd3ZFdldCRW9JM0xraWNEbEpVbVdnMWRMMCsrcHFDYmdRNE8zRTlwTFRM?=
 =?utf-8?B?a28yWnNvbTkxZ2txalpHV2Q4RVdoZXhHbHB3SktxU3kzdkNMQkFVNVlyVDlX?=
 =?utf-8?B?ajdEMk9BUDRQNDk2YXhxdXNQMmZUWk9nZXY3emJYOTdXa1dlZUN1eGNZM0s5?=
 =?utf-8?B?Z0hMRU94MHVsUFArUDdrUk4yc2EyMjdKbGpUOU1jSHk2VDdsRzRhRk9VQStZ?=
 =?utf-8?B?MXErRmdGRGpiSTVhY0hhUmJmUWJZOUdNdEZiSkZEOTdGV0JzcTZabnhvOGhl?=
 =?utf-8?B?a1J2Z1p2QUQ3dGhOUDNUTWp6SFJJTCtPUEFNRkF4S2tPVWtnenVVdzNhcVE1?=
 =?utf-8?B?cnFGSzQ5T295TSs5K0FWNmIvLzBEVURwWGVKR0FuRFk1ZURxOW5LbGV4b3hV?=
 =?utf-8?B?T21WM0IycnBVZE0rbUNyZlRrckw4SlV6cUY5MkhuRmY3NktJRVlxVkJCZWJq?=
 =?utf-8?B?eTBqa1UzTEw3Zm9zei9JR3o3UEMwNFZTaThwY01adXJXZklDTElVUW5ibHhP?=
 =?utf-8?Q?WOzI+yhbtgvEQqPAQSCEs7Cug?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93D9BE10E8B2D54FBE77A6DB4FEB042C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b1881e0-f414-4f48-268a-08db97614457
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2023 16:13:41.7110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z7Q+AHaqZ94AbH7crTyGzzghYOLYGNcnJu8qhawvnkiCR9NUNIabUeVTy1rnCFA1Pei6exzYoaSN6odHBayV/3z8wg2AmpX5RIV30NED+jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3373
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

DQoNCkxlIDMxLzA3LzIwMjMgw6AgMTA6NDIsIFVyb3MgQml6amFrIGEgw6ljcml0wqA6DQo+IFJl
d3JpdGUgbG9jYWxfYWRkX3VubGVzcyBhcyBhIHN0YXRpYyBpbmxpbmUgZnVuY3Rpb24gd2l0aCBi
b29sZWFuDQo+IHJldHVybiB2YWx1ZSwgc2ltaWxhciB0byBhcmNoX2F0b21pY19hZGRfdW5sZXNz
IGFyY2ggZmFsbGJhY2tzLg0KPiANCj4gVGhlIGZ1bmN0aW9uIGlzIGN1cnJlbnRseSB1bnVzZWQu
DQoNCklzIGl0IHdvcnRoIGtlZXBpbmcgdGhlIGZ1bmN0aW9uIGlmIGl0IGlzIG5vdCB1c2VkID8N
Cg0KQ2hyaXN0b3BoZQ0KDQo+IA0KPiBDYzogV2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4N
Cj4gQ2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4NCj4gQ2M6IEJvcXVu
IEZlbmcgPGJvcXVuLmZlbmdAZ21haWwuY29tPg0KPiBDYzogTWFyayBSdXRsYW5kIDxtYXJrLnJ1
dGxhbmRAYXJtLmNvbT4NCj4gQ2M6IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNv
bkBsaW5hcm8ub3JnPg0KPiBDYzogSXZhbiBLb2tzaGF5c2t5IDxpbmtAanVyYXNzaWMucGFyay5t
c3UucnU+DQo+IENjOiBNYXR0IFR1cm5lciA8bWF0dHN0ODhAZ21haWwuY29tPg0KPiBDYzogSHVh
Y2FpIENoZW4gPGNoZW5odWFjYWlAa2VybmVsLm9yZz4NCj4gQ2M6IFdBTkcgWHVlcnVpIDxrZXJu
ZWxAeGVuMG4ubmFtZT4NCj4gQ2M6IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNv
bT4NCj4gQ2M6IEp1biBZaSA8eWlqdW5AbG9vbmdzb24uY24+DQo+IENjOiBUaG9tYXMgQm9nZW5k
b2VyZmVyIDx0c2JvZ2VuZEBhbHBoYS5mcmFua2VuLmRlPg0KPiBDYzogTWljaGFlbCBFbGxlcm1h
biA8bXBlQGVsbGVybWFuLmlkLmF1Pg0KPiBDYzogTmljaG9sYXMgUGlnZ2luIDxucGlnZ2luQGdt
YWlsLmNvbT4NCj4gQ2M6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91
cC5ldT4NCj4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPg0KPiBDYzog
SW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+DQo+IENjOiBCb3Jpc2xhdiBQZXRrb3YgPGJw
QGFsaWVuOC5kZT4NCj4gQ2M6IERhdmUgSGFuc2VuIDxkYXZlLmhhbnNlbkBsaW51eC5pbnRlbC5j
b20+DQo+IENjOiAiSC4gUGV0ZXIgQW52aW4iIDxocGFAenl0b3IuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBVcm9zIEJpemphayA8dWJpempha0BnbWFpbC5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvYWxw
aGEvaW5jbHVkZS9hc20vbG9jYWwuaCAgICAgfCAzMyArKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0tLS0NCj4gICBhcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9sb2NhbC5oIHwgMjcgKysrKysr
KysrKysrKystLS0tLS0tLS0tDQo+ICAgYXJjaC9taXBzL2luY2x1ZGUvYXNtL2xvY2FsLmggICAg
ICB8IDI3ICsrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9sb2NhbC5oICAgfCAxMiArKysrKy0tLS0tLQ0KPiAgIGFyY2gveDg2L2luY2x1ZGUvYXNt
L2xvY2FsLmggICAgICAgfCAzMyArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0NCj4gICA1
IGZpbGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKyksIDYyIGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYWxwaGEvaW5jbHVkZS9hc20vbG9jYWwuaCBiL2FyY2gvYWxwaGEv
aW5jbHVkZS9hc20vbG9jYWwuaA0KPiBpbmRleCAwZmNhYWQ2NDJjYzMuLjg4ZWIzOTg5NDdhNSAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9hbHBoYS9pbmNsdWRlL2FzbS9sb2NhbC5oDQo+ICsrKyBiL2Fy
Y2gvYWxwaGEvaW5jbHVkZS9hc20vbG9jYWwuaA0KPiBAQCAtNjUsMjggKzY1LDI3IEBAIHN0YXRp
YyBfX2lubGluZV9fIGJvb2wgbG9jYWxfdHJ5X2NtcHhjaGcobG9jYWxfdCAqbCwgbG9uZyAqb2xk
LCBsb25nIG5ldykNCj4gICAjZGVmaW5lIGxvY2FsX3hjaGcobCwgbikgKHhjaGdfbG9jYWwoJigo
bCktPmEuY291bnRlciksIChuKSkpDQo+ICAgDQo+ICAgLyoqDQo+IC0gKiBsb2NhbF9hZGRfdW5s
ZXNzIC0gYWRkIHVubGVzcyB0aGUgbnVtYmVyIGlzIGEgZ2l2ZW4gdmFsdWUNCj4gKyAqIGxvY2Fs
X2FkZF91bmxlc3MgLSBhZGQgdW5sZXNzIHRoZSBudW1iZXIgaXMgYWxyZWFkeSBhIGdpdmVuIHZh
bHVlDQo+ICAgICogQGw6IHBvaW50ZXIgb2YgdHlwZSBsb2NhbF90DQo+ICAgICogQGE6IHRoZSBh
bW91bnQgdG8gYWRkIHRvIGwuLi4NCj4gICAgKiBAdTogLi4udW5sZXNzIGwgaXMgZXF1YWwgdG8g
dS4NCj4gICAgKg0KPiAtICogQXRvbWljYWxseSBhZGRzIEBhIHRvIEBsLCBzbyBsb25nIGFzIGl0
IHdhcyBub3QgQHUuDQo+IC0gKiBSZXR1cm5zIG5vbi16ZXJvIGlmIEBsIHdhcyBub3QgQHUsIGFu
ZCB6ZXJvIG90aGVyd2lzZS4NCj4gKyAqIEF0b21pY2FsbHkgYWRkcyBAYSB0byBAbCwgaWYgQHYg
d2FzIG5vdCBhbHJlYWR5IEB1Lg0KPiArICogUmV0dXJucyB0cnVlIGlmIHRoZSBhZGRpdGlvbiB3
YXMgZG9uZS4NCj4gICAgKi8NCj4gLSNkZWZpbmUgbG9jYWxfYWRkX3VubGVzcyhsLCBhLCB1KQkJ
CQlcDQo+IC0oewkJCQkJCQkJXA0KPiAtCWxvbmcgYywgb2xkOwkJCQkJCVwNCj4gLQljID0gbG9j
YWxfcmVhZChsKTsJCQkJCVwNCj4gLQlmb3IgKDs7KSB7CQkJCQkJXA0KPiAtCQlpZiAodW5saWtl
bHkoYyA9PSAodSkpKQkJCQlcDQo+IC0JCQlicmVhazsJCQkJCVwNCj4gLQkJb2xkID0gbG9jYWxf
Y21weGNoZygobCksIGMsIGMgKyAoYSkpOwlcDQo+IC0JCWlmIChsaWtlbHkob2xkID09IGMpKQkJ
CQlcDQo+IC0JCQlicmVhazsJCQkJCVwNCj4gLQkJYyA9IG9sZDsJCQkJCVwNCj4gLQl9CQkJCQkJ
CVwNCj4gLQljICE9ICh1KTsJCQkJCQlcDQo+IC19KQ0KPiArc3RhdGljIF9faW5saW5lX18gYm9v
bA0KPiArbG9jYWxfYWRkX3VubGVzcyhsb2NhbF90ICpsLCBsb25nIGEsIGxvbmcgdSkNCj4gK3sN
Cj4gKwlsb25nIGMgPSBsb2NhbF9yZWFkKGwpOw0KPiArDQo+ICsJZG8gew0KPiArCQlpZiAodW5s
aWtlbHkoYyA9PSB1KSkNCj4gKwkJCXJldHVybiBmYWxzZTsNCj4gKwl9IHdoaWxlICghbG9jYWxf
dHJ5X2NtcHhjaGcobCwgJmMsIGMgKyBhKSk7DQo+ICsNCj4gKwlyZXR1cm4gdHJ1ZTsNCj4gK30N
Cj4gKw0KPiAgICNkZWZpbmUgbG9jYWxfaW5jX25vdF96ZXJvKGwpIGxvY2FsX2FkZF91bmxlc3Mo
KGwpLCAxLCAwKQ0KPiAgIA0KPiAgICNkZWZpbmUgbG9jYWxfYWRkX25lZ2F0aXZlKGEsIGwpIChs
b2NhbF9hZGRfcmV0dXJuKChhKSwgKGwpKSA8IDApDQo+IGRpZmYgLS1naXQgYS9hcmNoL2xvb25n
YXJjaC9pbmNsdWRlL2FzbS9sb2NhbC5oIGIvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vbG9j
YWwuaA0KPiBpbmRleCA4M2U5OTViMzBlNDcuLjE1YmMzNTc5ZjE2YyAxMDA2NDQNCj4gLS0tIGEv
YXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vbG9jYWwuaA0KPiArKysgYi9hcmNoL2xvb25nYXJj
aC9pbmNsdWRlL2FzbS9sb2NhbC5oDQo+IEBAIC03MCwyMiArNzAsMjcgQEAgc3RhdGljIGlubGlu
ZSBib29sIGxvY2FsX3RyeV9jbXB4Y2hnKGxvY2FsX3QgKmwsIGxvbmcgKm9sZCwgbG9uZyBuZXcp
DQo+ICAgI2RlZmluZSBsb2NhbF94Y2hnKGwsIG4pIChhdG9taWNfbG9uZ194Y2hnKCgmKGwpLT5h
KSwgKG4pKSkNCj4gICANCj4gICAvKioNCj4gLSAqIGxvY2FsX2FkZF91bmxlc3MgLSBhZGQgdW5s
ZXNzIHRoZSBudW1iZXIgaXMgYSBnaXZlbiB2YWx1ZQ0KPiArICogbG9jYWxfYWRkX3VubGVzcyAt
IGFkZCB1bmxlc3MgdGhlIG51bWJlciBpcyBhbHJlYWR5IGEgZ2l2ZW4gdmFsdWUNCj4gICAgKiBA
bDogcG9pbnRlciBvZiB0eXBlIGxvY2FsX3QNCj4gICAgKiBAYTogdGhlIGFtb3VudCB0byBhZGQg
dG8gbC4uLg0KPiAgICAqIEB1OiAuLi51bmxlc3MgbCBpcyBlcXVhbCB0byB1Lg0KPiAgICAqDQo+
IC0gKiBBdG9taWNhbGx5IGFkZHMgQGEgdG8gQGwsIHNvIGxvbmcgYXMgaXQgd2FzIG5vdCBAdS4N
Cj4gLSAqIFJldHVybnMgbm9uLXplcm8gaWYgQGwgd2FzIG5vdCBAdSwgYW5kIHplcm8gb3RoZXJ3
aXNlLg0KPiArICogQXRvbWljYWxseSBhZGRzIEBhIHRvIEBsLCBpZiBAdiB3YXMgbm90IGFscmVh
ZHkgQHUuDQo+ICsgKiBSZXR1cm5zIHRydWUgaWYgdGhlIGFkZGl0aW9uIHdhcyBkb25lLg0KPiAg
ICAqLw0KPiAtI2RlZmluZSBsb2NhbF9hZGRfdW5sZXNzKGwsIGEsIHUpCQkJCVwNCj4gLSh7CQkJ
CQkJCQlcDQo+IC0JbG9uZyBjLCBvbGQ7CQkJCQkJXA0KPiAtCWMgPSBsb2NhbF9yZWFkKGwpOwkJ
CQkJXA0KPiAtCXdoaWxlIChjICE9ICh1KSAmJiAob2xkID0gbG9jYWxfY21weGNoZygobCksIGMs
IGMgKyAoYSkpKSAhPSBjKSBcDQo+IC0JCWMgPSBvbGQ7CQkJCQlcDQo+IC0JYyAhPSAodSk7CQkJ
CQkJXA0KPiAtfSkNCj4gK3N0YXRpYyBpbmxpbmUgYm9vbA0KPiArbG9jYWxfYWRkX3VubGVzcyhs
b2NhbF90ICpsLCBsb25nIGEsIGxvbmcgdSkNCj4gK3sNCj4gKwlsb25nIGMgPSBsb2NhbF9yZWFk
KGwpOw0KPiArDQo+ICsJZG8gew0KPiArCQlpZiAodW5saWtlbHkoYyA9PSB1KSkNCj4gKwkJCXJl
dHVybiBmYWxzZTsNCj4gKwl9IHdoaWxlICghbG9jYWxfdHJ5X2NtcHhjaGcobCwgJmMsIGMgKyBh
KSk7DQo+ICsNCj4gKwlyZXR1cm4gdHJ1ZTsNCj4gK30NCj4gKw0KPiAgICNkZWZpbmUgbG9jYWxf
aW5jX25vdF96ZXJvKGwpIGxvY2FsX2FkZF91bmxlc3MoKGwpLCAxLCAwKQ0KPiAgIA0KPiAgICNk
ZWZpbmUgbG9jYWxfZGVjX3JldHVybihsKSBsb2NhbF9zdWJfcmV0dXJuKDEsIChsKSkNCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9sb2NhbC5oIGIvYXJjaC9taXBzL2luY2x1
ZGUvYXNtL2xvY2FsLmgNCj4gaW5kZXggNWRhZjZmZThlM2U5Li45MDQzNTE1OGEwODMgMTAwNjQ0
DQo+IC0tLSBhL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9sb2NhbC5oDQo+ICsrKyBiL2FyY2gvbWlw
cy9pbmNsdWRlL2FzbS9sb2NhbC5oDQo+IEBAIC0xMDgsMjIgKzEwOCwyNyBAQCBzdGF0aWMgX19p
bmxpbmVfXyBib29sIGxvY2FsX3RyeV9jbXB4Y2hnKGxvY2FsX3QgKmwsIGxvbmcgKm9sZCwgbG9u
ZyBuZXcpDQo+ICAgI2RlZmluZSBsb2NhbF94Y2hnKGwsIG4pIChhdG9taWNfbG9uZ194Y2hnKCgm
KGwpLT5hKSwgKG4pKSkNCj4gICANCj4gICAvKioNCj4gLSAqIGxvY2FsX2FkZF91bmxlc3MgLSBh
ZGQgdW5sZXNzIHRoZSBudW1iZXIgaXMgYSBnaXZlbiB2YWx1ZQ0KPiArICogbG9jYWxfYWRkX3Vu
bGVzcyAtIGFkZCB1bmxlc3MgdGhlIG51bWJlciBpcyBhbHJlYWR5IGEgZ2l2ZW4gdmFsdWUNCj4g
ICAgKiBAbDogcG9pbnRlciBvZiB0eXBlIGxvY2FsX3QNCj4gICAgKiBAYTogdGhlIGFtb3VudCB0
byBhZGQgdG8gbC4uLg0KPiAgICAqIEB1OiAuLi51bmxlc3MgbCBpcyBlcXVhbCB0byB1Lg0KPiAg
ICAqDQo+IC0gKiBBdG9taWNhbGx5IGFkZHMgQGEgdG8gQGwsIHNvIGxvbmcgYXMgaXQgd2FzIG5v
dCBAdS4NCj4gLSAqIFJldHVybnMgbm9uLXplcm8gaWYgQGwgd2FzIG5vdCBAdSwgYW5kIHplcm8g
b3RoZXJ3aXNlLg0KPiArICogQXRvbWljYWxseSBhZGRzIEBhIHRvIEBsLCBpZiBAdiB3YXMgbm90
IGFscmVhZHkgQHUuDQo+ICsgKiBSZXR1cm5zIHRydWUgaWYgdGhlIGFkZGl0aW9uIHdhcyBkb25l
Lg0KPiAgICAqLw0KPiAtI2RlZmluZSBsb2NhbF9hZGRfdW5sZXNzKGwsIGEsIHUpCQkJCVwNCj4g
LSh7CQkJCQkJCQlcDQo+IC0JbG9uZyBjLCBvbGQ7CQkJCQkJXA0KPiAtCWMgPSBsb2NhbF9yZWFk
KGwpOwkJCQkJXA0KPiAtCXdoaWxlIChjICE9ICh1KSAmJiAob2xkID0gbG9jYWxfY21weGNoZygo
bCksIGMsIGMgKyAoYSkpKSAhPSBjKSBcDQo+IC0JCWMgPSBvbGQ7CQkJCQlcDQo+IC0JYyAhPSAo
dSk7CQkJCQkJXA0KPiAtfSkNCj4gK3N0YXRpYyBfX2lubGluZV9fIGJvb2wNCj4gK2xvY2FsX2Fk
ZF91bmxlc3MobG9jYWxfdCAqbCwgbG9uZyBhLCBsb25nIHUpDQo+ICt7DQo+ICsJbG9uZyBjID0g
bG9jYWxfcmVhZChsKTsNCj4gKw0KPiArCWRvIHsNCj4gKwkJaWYgKHVubGlrZWx5KGMgPT0gdSkp
DQo+ICsJCQlyZXR1cm4gZmFsc2U7DQo+ICsJfSB3aGlsZSAoIWxvY2FsX3RyeV9jbXB4Y2hnKGws
ICZjLCBjICsgYSkpOw0KPiArDQo+ICsJcmV0dXJuIHRydWU7DQo+ICt9DQo+ICsNCj4gICAjZGVm
aW5lIGxvY2FsX2luY19ub3RfemVybyhsKSBsb2NhbF9hZGRfdW5sZXNzKChsKSwgMSwgMCkNCj4g
ICANCj4gICAjZGVmaW5lIGxvY2FsX2RlY19yZXR1cm4obCkgbG9jYWxfc3ViX3JldHVybigxLCAo
bCkpDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbG9jYWwuaCBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9sb2NhbC5oDQo+IGluZGV4IDQ1NDkyZmI1YmYyMi4uZWM2
Y2VkNmQ3Y2VkIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbG9jYWwu
aA0KPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbG9jYWwuaA0KPiBAQCAtMTE1LDIz
ICsxMTUsMjMgQEAgc3RhdGljIF9faW5saW5lX18gbG9uZyBsb2NhbF94Y2hnKGxvY2FsX3QgKmws
IGxvbmcgbikNCj4gICB9DQo+ICAgDQo+ICAgLyoqDQo+IC0gKiBsb2NhbF9hZGRfdW5sZXNzIC0g
YWRkIHVubGVzcyB0aGUgbnVtYmVyIGlzIGEgZ2l2ZW4gdmFsdWUNCj4gKyAqIGxvY2FsX2FkZF91
bmxlc3MgLSBhZGQgdW5sZXNzIHRoZSBudW1iZXIgaXMgYWxyZWFkeSBhIGdpdmVuIHZhbHVlDQo+
ICAgICogQGw6IHBvaW50ZXIgb2YgdHlwZSBsb2NhbF90DQo+ICAgICogQGE6IHRoZSBhbW91bnQg
dG8gYWRkIHRvIHYuLi4NCj4gICAgKiBAdTogLi4udW5sZXNzIHYgaXMgZXF1YWwgdG8gdS4NCj4g
ICAgKg0KPiAtICogQXRvbWljYWxseSBhZGRzIEBhIHRvIEBsLCBzbyBsb25nIGFzIGl0IHdhcyBu
b3QgQHUuDQo+IC0gKiBSZXR1cm5zIG5vbi16ZXJvIGlmIEBsIHdhcyBub3QgQHUsIGFuZCB6ZXJv
IG90aGVyd2lzZS4NCj4gKyAqIEF0b21pY2FsbHkgYWRkcyBAYSB0byBAbCwgaWYgQHYgd2FzIG5v
dCBhbHJlYWR5IEB1Lg0KPiArICogUmV0dXJucyB0cnVlIGlmIHRoZSBhZGRpdGlvbiB3YXMgZG9u
ZS4NCj4gICAgKi8NCj4gLXN0YXRpYyBfX2lubGluZV9fIGludCBsb2NhbF9hZGRfdW5sZXNzKGxv
Y2FsX3QgKmwsIGxvbmcgYSwgbG9uZyB1KQ0KPiArc3RhdGljIF9faW5saW5lX18gYm9vbCBsb2Nh
bF9hZGRfdW5sZXNzKGxvY2FsX3QgKmwsIGxvbmcgYSwgbG9uZyB1KQ0KPiAgIHsNCj4gICAJdW5z
aWduZWQgbG9uZyBmbGFnczsNCj4gLQlpbnQgcmV0ID0gMDsNCj4gKwlib29sIHJldCA9IGZhbHNl
Ow0KPiAgIA0KPiAgIAlwb3dlcnBjX2xvY2FsX2lycV9wbXVfc2F2ZShmbGFncyk7DQo+ICAgCWlm
IChsLT52ICE9IHUpIHsNCj4gICAJCWwtPnYgKz0gYTsNCj4gLQkJcmV0ID0gMTsNCj4gKwkJcmV0
ID0gdHJ1ZTsNCj4gICAJfQ0KPiAgIAlwb3dlcnBjX2xvY2FsX2lycV9wbXVfcmVzdG9yZShmbGFn
cyk7DQo+ICAgDQo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9sb2NhbC5oIGIv
YXJjaC94ODYvaW5jbHVkZS9hc20vbG9jYWwuaA0KPiBpbmRleCA1NmQ0ZWY2MDRiOTEuLjQ2Y2U5
MmQ0ZTU1NiAxMDA2NDQNCj4gLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vbG9jYWwuaA0KPiAr
KysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9sb2NhbC5oDQo+IEBAIC0xMzUsMjggKzEzNSwyNyBA
QCBzdGF0aWMgaW5saW5lIGJvb2wgbG9jYWxfdHJ5X2NtcHhjaGcobG9jYWxfdCAqbCwgbG9uZyAq
b2xkLCBsb25nIG5ldykNCj4gICAjZGVmaW5lIGxvY2FsX3hjaGcobCwgbikgKHhjaGcoJigobCkt
PmEuY291bnRlciksIChuKSkpDQo+ICAgDQo+ICAgLyoqDQo+IC0gKiBsb2NhbF9hZGRfdW5sZXNz
IC0gYWRkIHVubGVzcyB0aGUgbnVtYmVyIGlzIGEgZ2l2ZW4gdmFsdWUNCj4gKyAqIGxvY2FsX2Fk
ZF91bmxlc3MgLSBhZGQgdW5sZXNzIHRoZSBudW1iZXIgaXMgYWxyZWFkeSBhIGdpdmVuIHZhbHVl
DQo+ICAgICogQGw6IHBvaW50ZXIgb2YgdHlwZSBsb2NhbF90DQo+ICAgICogQGE6IHRoZSBhbW91
bnQgdG8gYWRkIHRvIGwuLi4NCj4gICAgKiBAdTogLi4udW5sZXNzIGwgaXMgZXF1YWwgdG8gdS4N
Cj4gICAgKg0KPiAtICogQXRvbWljYWxseSBhZGRzIEBhIHRvIEBsLCBzbyBsb25nIGFzIGl0IHdh
cyBub3QgQHUuDQo+IC0gKiBSZXR1cm5zIG5vbi16ZXJvIGlmIEBsIHdhcyBub3QgQHUsIGFuZCB6
ZXJvIG90aGVyd2lzZS4NCj4gKyAqIEF0b21pY2FsbHkgYWRkcyBAYSB0byBAbCwgaWYgQHYgd2Fz
IG5vdCBhbHJlYWR5IEB1Lg0KPiArICogUmV0dXJucyB0cnVlIGlmIHRoZSBhZGRpdGlvbiB3YXMg
ZG9uZS4NCj4gICAgKi8NCj4gLSNkZWZpbmUgbG9jYWxfYWRkX3VubGVzcyhsLCBhLCB1KQkJCQlc
DQo+IC0oewkJCQkJCQkJXA0KPiAtCWxvbmcgYywgb2xkOwkJCQkJCVwNCj4gLQljID0gbG9jYWxf
cmVhZCgobCkpOwkJCQkJXA0KPiAtCWZvciAoOzspIHsJCQkJCQlcDQo+IC0JCWlmICh1bmxpa2Vs
eShjID09ICh1KSkpCQkJCVwNCj4gLQkJCWJyZWFrOwkJCQkJXA0KPiAtCQlvbGQgPSBsb2NhbF9j
bXB4Y2hnKChsKSwgYywgYyArIChhKSk7CQlcDQo+IC0JCWlmIChsaWtlbHkob2xkID09IGMpKQkJ
CQlcDQo+IC0JCQlicmVhazsJCQkJCVwNCj4gLQkJYyA9IG9sZDsJCQkJCVwNCj4gLQl9CQkJCQkJ
CVwNCj4gLQljICE9ICh1KTsJCQkJCQlcDQo+IC19KQ0KPiArc3RhdGljIF9fYWx3YXlzX2lubGlu
ZSBib29sDQo+ICtsb2NhbF9hZGRfdW5sZXNzKGxvY2FsX3QgKmwsIGxvbmcgYSwgbG9uZyB1KQ0K
PiArew0KPiArCWxvbmcgYyA9IGxvY2FsX3JlYWQobCk7DQo+ICsNCj4gKwlkbyB7DQo+ICsJCWlm
ICh1bmxpa2VseShjID09IHUpKQ0KPiArCQkJcmV0dXJuIGZhbHNlOw0KPiArCX0gd2hpbGUgKCFs
b2NhbF90cnlfY21weGNoZyhsLCAmYywgYyArIGEpKTsNCj4gKw0KPiArCXJldHVybiB0cnVlOw0K
PiArfQ0KPiArDQo+ICAgI2RlZmluZSBsb2NhbF9pbmNfbm90X3plcm8obCkgbG9jYWxfYWRkX3Vu
bGVzcygobCksIDEsIDApDQo+ICAgDQo+ICAgLyogT24geDg2XzMyLCB0aGVzZSBhcmUgbm8gYmV0
dGVyIHRoYW4gdGhlIGF0b21pYyB2YXJpYW50cy4NCg==

Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2FB876A59A
	for <lists+linux-mips@lfdr.de>; Tue,  1 Aug 2023 02:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjHAAjJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 20:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjHAAjG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 20:39:06 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0FFE8;
        Mon, 31 Jul 2023 17:39:04 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36VJpnIb028453;
        Mon, 31 Jul 2023 17:38:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=1rx8iav72rEk/ppHHeSZhXnVda79lsCvBnCdbC+b4us=;
 b=Dc5gaYBmhgaQ24lp+Kv3o5QeYrJZhO3EqOQqndS4z63LLSxJnelyWHRk4doAYlR7imR1
 D2tbOJQtFyh3E1gzyIJQ+sHzXkf0MwlkBbWML8kTV4SGu3vl0Tx/t560bJ/PtEmc2J6S
 DAxTe9XKaLui2wL8dAL1YfLoybvOXA9+fDRAPXEp2qRohVtdNy7eHCKp5jSn9bGdU5PN
 pk72xJcOmsDs4pdWtIXPNKB4A2+xPFKfda0sMkk3erwfYzIEquMXvUzZKfVBMh7tg7bE
 l/rz815RlEAr4iUlU4Q1rB1fN6ne4inpoInbRqOkFAxwRwba2i4pixSaGlC/MAE14Ad0 Gg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3s51dcswax-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 31 Jul 2023 17:38:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1690850333; bh=1rx8iav72rEk/ppHHeSZhXnVda79lsCvBnCdbC+b4us=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=SgNjoXF8iU+IQkz5MmX97o/XhzTx5cJPLWfdjpp+MDAfNwqfk0W4aK8cfRN6hGAlR
         I4MwXNcmDoQ+5tjFwgsr/ZjUnFBi//TYMgj1Ko3QhOhxB+rrMLZNDZp3UaxvvX16F8
         ur3SoLiRjpUSWlhveo2mw7JnOzA3Gj9ELvHuspcTrt0T399ga4+JsLIyEC6QU8rqHa
         FqkAmG+x9T8YpSinqFejWtwh7P6lLlKI3cnAX0BgmZcUQfvuqgCA2Ez17vn/Orr35e
         QDUCrjIqU5g1z3uXNv3X9ZMxuW1wIJ/rZmxAov6IdKe0Pgs7DVgtgguiSBPSr3rxqL
         xWdBgve5IYLew==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 17CB640145;
        Tue,  1 Aug 2023 00:38:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 72625A0083;
        Tue,  1 Aug 2023 00:38:50 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=w6WUCoTn;
        dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id CC15E4059E;
        Tue,  1 Aug 2023 00:38:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CV8ojZEn1bGrI7ybNYh9LTo/fqEytHH/e4GX1en2Up8ZIl8XXjesXBf2ME8HmWv96FSnLacseC2cohURc4Pg8I5VunPC1wJ2WyurT0vvhWDYEjY40xwL+zDz064/e4D09vCpywOZ1+3TXUanmbhBks7ZP0ILpAbfIETZ7RVR29RRnamKUy3bqANpbBg9nCrPL2If/Ac2L54pr0ep29PasXevGGnZXrnMNJpczDAX2dC/EVeFqf+XyUdDHhn3N7WL+IMneHUS9wF2ChuppQMMu8Ek//Bn0zqBGgvR5DzFKoGV/RhciQKa0vaIe402xwEs0Le4jIbGIhM5h/N17eMzKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rx8iav72rEk/ppHHeSZhXnVda79lsCvBnCdbC+b4us=;
 b=dGXc/RlRxEPblKGp9fHI9dWCNgy2Q30Ekicv4BRJTvgTW4wrAvVieSBxX2Go8hlpUvkjg8wWxKbHk0Vr6JCyuRYORwbJJWlbs9ACb52a+eAppRAjF+iujygN8wpObuGh3DB3grZBQOtp/XjpSVN7MuaimBhnu3AMg+eGRq1UL/nCrssHIqwD3/hJ/WXYsuMOH0juf7V5WQp7W3H9YqElHMQl1Uu8PHQBlEG5nGe/qZM/r6OJnlnTC2SvXJqrFrQpn4aXJbnvBiapnCoo3yGmFdlP+LoHyc20sRZPBJ0fwocgHFsCFjLOb0isjzVKTQKGWABSAFh+frrZKC+h28zBHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rx8iav72rEk/ppHHeSZhXnVda79lsCvBnCdbC+b4us=;
 b=w6WUCoTngFB+wdMcvkDgdkIENASxRwce2byJCDVkkHmZ1F2vOMy1U6mYbONVYs4ibPyQZkC9gLSkt7wYTbVKsQY+zsiM/+EhnNmEynMWPIYvVUNFRRz9xZFrqtXYO8WNWJwx+BabY5JPzsiy2cDIuQp9TzNUMsk6cJdCLQUfegc=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by CH2PR12MB4166.namprd12.prod.outlook.com (2603:10b6:610:78::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 00:38:44 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::138d:ed63:a424:1f33]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::138d:ed63:a424:1f33%5]) with mapi id 15.20.6631.042; Tue, 1 Aug 2023
 00:38:44 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5 4/7] usb: dwc3: dwc3-octeon: Avoid half-initialized
 controller state
Thread-Topic: [PATCH v5 4/7] usb: dwc3: dwc3-octeon: Avoid half-initialized
 controller state
Thread-Index: AQHZw5Hq0x+4HFony0iQUSJ7/Fn126/UmeIA
Date:   Tue, 1 Aug 2023 00:38:43 +0000
Message-ID: <20230801003838.ifbydrbwq34df3n3@synopsys.com>
References: <ZMd/HzISn0mPsNWt@lenoch> <ZMd/oMRx8ze22/kK@lenoch>
In-Reply-To: <ZMd/oMRx8ze22/kK@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|CH2PR12MB4166:EE_
x-ms-office365-filtering-correlation-id: a50f1539-8472-498d-971d-08db9227a8ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XFuVj8DDGZbfi2zOBNqCKNx6/RxaRragg05RlJtJlhNRv/gED2jlk3uaQMZ3Yfsstc8FSP11v56mC5E0uUTvfi/UvyA2p+X2wFUBknx5jTWh0JGtea/cgS2SO0rGP0SVK0DEAxtpUYNQgxqbDLWZ3dDJJmxZuWwjw/uOnu7WsgOQ8YJ4OPzhHH8p7Ni9p45NWhnPAWuCib7wfH9M4ogszRwXgQ7A708BRoPCakCg8bLhBM9XyICndmhOYVqLpJ52+LLF+bu/zpaHAB9JSUwPp8ruwfEYiq4rP9Of2m8sfTfVqPqtM8zOrjGv45EDrnNzP/8JVbtFcssaBnAx+KFOl9m4HVA8MD25l/TKUqXV+oWUDM9wStIiB0B77r6I6A2Nkt15D+PZqA+ARn/1oUdUosEOTTnar31QosJLW6Y5p5q/XSkkd32EHRpP1NR9OWKW1ewR0JYbDg1YstGAjGe6FQPvMc0BVJ7nq7XFrsuJW0FIZGufhXuOuUkzGzCMdCi0ga3AJPrDK6BbGBTszwFvSIlCNHgAVKWinpr4tWWYSzUEEc49L+u+GlT84bechs32cK25EswMGduDGDN5D/z8raTMdK8OlfJ8tDIJMES7GBZAloKr6mCkt346Wn3a7mZB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(6512007)(6486002)(36756003)(2616005)(6506007)(26005)(1076003)(83380400001)(186003)(76116006)(66946007)(66556008)(54906003)(122000001)(38070700005)(41300700001)(38100700002)(86362001)(66476007)(316002)(5660300002)(66446008)(6916009)(4326008)(8676002)(8936002)(64756008)(2906002)(71200400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1ZBZlNpOHdpNDRsbGwxcjViQUlYZVlUcnIwRTNCTW84UGh6MVBFYWxNM0E3?=
 =?utf-8?B?RmpIL01pRUpTeXh4N0hwV1IxVTZkOEhoa0w5dkZSVlFNZmRDOG1XMmhVd3Zx?=
 =?utf-8?B?WVkwNTBxM2lPVjREWXdVYnRzSHUrTzlGVm5jblNKTjk3Zk5WaFJidm1sNGhC?=
 =?utf-8?B?QnUwTWtaK2ZLbVQzWTFZVWJJeXVKWkVuZ3lGUlVieStxOE1DOStQcVB3cklG?=
 =?utf-8?B?ZGFKMmtnM3NKM1k5aUFrQ2prc0xON1pSQ0Z5QXlQVGNlVkY3a3U3WmZ3UEYz?=
 =?utf-8?B?R0dWWFVkMDI5OGI5cnJ5QWFKOHdqNHIxOGVZUjVZbC9JaVMzZVBSZ1ZVeUtt?=
 =?utf-8?B?Z1NkWGdiU2txU1Q3UzRCM1l6d21uRmVqTjhMZld5K255NmFnNlNCWW1Td3ZO?=
 =?utf-8?B?OUZ4TFZCVHRRREhBNFFmakNhNDZFVTdqcDcyMGZXZlpJQ2Z3a3M2RjhiUXk3?=
 =?utf-8?B?RjBVMzVYWlMxZ3V1NTVwOGd3Yk5HY2ZuQWxpeTJoZUZFVkFqRmd0UVRPN2F0?=
 =?utf-8?B?WHFDcVhSTC9sbHdOZGVPanFMbTNVTTN4WEc1SVFXYkwxY3RFRlEraHI2Tkhv?=
 =?utf-8?B?U21qL2xzK2xROERrUHRMQjFvbGh1SERiMUZQTTl1SlpJN2tBbmZ6djdUUUNk?=
 =?utf-8?B?Z1BpcnpIRGl6MzYzM2FCNVgySElwMHZ1UXJDVTRybE1YY0d0YXFnKzEzU0hR?=
 =?utf-8?B?RmlGWUtqSVdjdXVFb0hrbkJkUGRSNXlFaU4zUnlTMnlXUGUyc1Y0dlhSQkgz?=
 =?utf-8?B?OVMxNk1rSncxdmczbW1OWnEyTUNyS0ZWd0UxWFF1QjZPcDlObE44UUs0Yk9v?=
 =?utf-8?B?VUcyQUZRVVlOZmprWVd4K2lUalJpZ1l4amwwRStFc1BMcXRMbHY2andtWXlX?=
 =?utf-8?B?ZnpOTlFYQXNBdEhteThieHg3QVg2M0tyZlY1SXR0WFpqMThpTHhRS0kxSTRk?=
 =?utf-8?B?L21rbjRmRk1jSVVYZzQ3QkNNYmdRMkI3Y0JxbGkyUE8vRXp6S1lnaEpPTjRh?=
 =?utf-8?B?UmkxV3NlSU12cm8yaG5XR2NLZ2h1d0hxWGZqdytBbGlHY085bC9uWklROGlY?=
 =?utf-8?B?UEFkT1AzdDduOWdkeWdXSlFpT1NPWllnaFpId0QzK2czeXlzR3lJeXRlci92?=
 =?utf-8?B?cnpzSXFLdlUreENDZm5oTkhmR0FIRmQxTStoT3YzbEtTMVNiVnlwci8wam1C?=
 =?utf-8?B?TEVwdDN1WVhRcU1XYnJjMmxGRWc3RWozN1NGd2lNV08zTEkxUW9xZU9yRFdI?=
 =?utf-8?B?L0Uvc0JDaWtHeHZmMmxPb1BmTGFKd2hnUzRyRTlJS25sOUZBM2hWSDN6Qk82?=
 =?utf-8?B?eHlBTGhIK0J2WlhIQ1BpYkU4RUVhL1pFZnU4bXV6UFhKdkoxSU5kQ0QrbWtW?=
 =?utf-8?B?ekNMV3JSZjBZZ1ExVWVpQ3hjcVlmYmorNW4yR1hrVFFQTkhEOVI3WnJLN1JV?=
 =?utf-8?B?VXE0V2c1K05DVGs4eHNXbm1LcVhJZ2JBS09Dd3NxTUhXa2hnb3hSR3hwZ0FB?=
 =?utf-8?B?Sm8xM2lvM1RzV0dGWGdhYmNpTTBuSjNYck9PRmV3VXU3MjducUUwS2tYQmNS?=
 =?utf-8?B?UVFsV0ZSVkNjdHFIVllTZHREQmxUZ29OS3hnbjAyQXFFRitHOSsxbzVOampu?=
 =?utf-8?B?NVJxSVBGWFVyNldrZGNHcmRvQlV1ck5wcDBOaXdZZTcvUzMyYjFIV01sNUVx?=
 =?utf-8?B?YVoySHBVSFoyb1QxNFlxcXJ4bDNVK2ZhbjhzM2t0UG1UK0FZQmRQaGgwZ2gz?=
 =?utf-8?B?Z3NBbzBTZXZCUlBUYmQ1TElKL0ZnRkYwak4vYTlnM1JXQVRINjNOT2hQYjgx?=
 =?utf-8?B?K3FQVW5qZUdHZk5JNUVRdGpjTENQK25MdmZKZStOVUJVV3lQTjZZUE9CU1do?=
 =?utf-8?B?K2FvK2ZFcXpWNFpwZCtCYllsTkxRK3VjV25mYTFRRzNjWjBIU3diNHMyRVMy?=
 =?utf-8?B?VW5RR3o2YkdOaXg0K3F5ajFRMGxpK296cDI4dFIyRE9xcVVoelJMOEZDVytq?=
 =?utf-8?B?QjhWOTVYTUdGcXkvOWFoVmJtVU54ekREeTNKTDdxRUh0Yjgwc3hoclZsYTZB?=
 =?utf-8?B?MFpUcTFKRXV1QlRRMWZIRWZ5aERZazVuam40UTZaK1RWUGRZRElQdUFSaVFi?=
 =?utf-8?Q?g7KLTos6FBN0DPGVuOJpFN9MQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64548F4A33EC0A438F8D4E7FE2F1FE36@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?eS9wZHBCQW9zSHlBZ3B2QzNhSDNCbUhsN2NBZW13SFVBVTZUSFVucnFzczVo?=
 =?utf-8?B?QXJ4Y0UwczVXdy9hdU1RQ1I3cFVZNkJBMzFueU5kUDJCYldtSytLZmJnczhG?=
 =?utf-8?B?Zk5nWkdMbU5DcStkM3IzVjljUEdNdjhCS29XQ25FcEJJc1p6aFRycW1GcGxR?=
 =?utf-8?B?dVlRTEtUT3IxZ2FLWTdDL29yVVlPd3dKclJ5SDJPdmw2eTVsM0FsQ1ExNWRO?=
 =?utf-8?B?dngzSndSL3RheHhSY01DakRvaVhWQUxtZTJtLytEQ042VjhMK1daRkRKNEY1?=
 =?utf-8?B?VVV3VHc2STFPT2tNeUxCUG1ZTklzKzdnc01IeUY2RlZKVURtZE5XRDhUZGky?=
 =?utf-8?B?R2Nrekk3YjN2TlAyaGZIK2pGWUpXc3gydmxvV04wOHFZTmRmYjYyR3BzQnN5?=
 =?utf-8?B?aW1nTElteUoxYllFMWFwcm1TRldENitTejJmd0hkc25KcUIzZ1JEQ0lNWTVK?=
 =?utf-8?B?MmRTQmhzcUMrVHZNY3BWNzFVSWlPb09McDVNMFB4ZG5RMVdHNlJEWitnVUV3?=
 =?utf-8?B?eHJqdEtzWDQ0RmdJYzJtYUxBRlc2UmliYVhxOGZ1a0Q1L05lcDQwTEswYWZV?=
 =?utf-8?B?MDlxczU0TXlmQWsyT2grYnh0S1NIUHR6b1A5djMxWGRFTStoUUZLWHVsSWhr?=
 =?utf-8?B?Y1QwK1p4RW9rZ05vekthTHRITjI0VUZGM0xVOVRKMmpPYnhrMk9pVHpDMysz?=
 =?utf-8?B?bmczWndUTkY1MFM0SGxlaWVJMTM4L2xhT3l4ci9EeTI5MXdWSStqOUlPUW1i?=
 =?utf-8?B?N0xEN3J2NTc0dTJBdDFmbWpqeW51SU5GbVRLUFkzcmtOaVV3U0Njby9wTHFL?=
 =?utf-8?B?VkNVTDRWdGVjK3pmc3RzajhkU1A2b2RKN2lWNGwrRVRvVmNvSDVVODdTd0VZ?=
 =?utf-8?B?UE91amdkSDQvckQvY21WazA1N1hub08wc01PQ3d4SEN4R0piK1JjYXAzUGlR?=
 =?utf-8?B?TXBwV3lHNWhPUHJGVVRWbUpuZmtkTmMrWVlZZDFVWmg1N2htQ1BtYW81TEFt?=
 =?utf-8?B?RDdSU3RYbkJhdFQ0dHVzV2VLcTYrTmlsbkNTUkdhNWY1azVmb1dRbVFtV3dV?=
 =?utf-8?B?bXVpd05rWDZJYUtGYXU3NEtydkxINitkSll1RW9wZlRPK2pQNWg0a1lWMFN2?=
 =?utf-8?B?VWpuYytzUmdGOUdSNFV5cmNqTndqbE1ZRDBKdFV1K2ZLNEVoc2ppalV3eW0x?=
 =?utf-8?B?ak9CUWRxaExjNmE2dzJoQ2NiN241VUkrRE9VSFFSK1FSSmN0ZTMvalpvNFRD?=
 =?utf-8?Q?cxpXf/Pst7aECok?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a50f1539-8472-498d-971d-08db9227a8ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 00:38:43.8185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cICvXHOIfZvfZXZDT4gB3FsPvwc4VjOyRspX6/jKD5JX4289TIP+aI7DtWvRUMcKTx623BSNZmIecU+a39auBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4166
X-Proofpoint-GUID: 2B1xUKdqnTq9y6a0Ev2qjCydruv1Mxsh
X-Proofpoint-ORIG-GUID: 2B1xUKdqnTq9y6a0Ev2qjCydruv1Mxsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_17,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 adultscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308010003
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gTW9uLCBKdWwgMzEsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBGcm9tOiBMYWRp
c2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IA0KPiBQb3dlciBncGlvIGNvbmZp
Z3VyYXRpb24gaXMgZG9uZSBmcm9tIHRoZSBtaWRkbGUgb2YNCj4gZHdjM19vY3Rlb25fY2xvY2tz
X3N0YXJ0IGxlYXZpbmcgaGFyZHdhcmUgaW4gaGFsZi1pbml0aWFsaXplZA0KPiBzdGF0ZSBpZiBp
dCBmYWlscy4gQXMgdGhhdCBpbmRpY2F0ZXMgZHdjM19vY3Rlb25fY2xvY2tzX3N0YXJ0DQo+IGRv
ZXMgbW9yZSB0aGFuIGp1c3QgaW5pdGlhbGl6ZSB0aGUgY2xvY2tzIHJlbmFtZSBpdCBhcHByb3By
aWF0ZWx5DQo+IGFuZCB2ZXJpZnkgcG93ZXIgZ3BpbyBjb25maWd1cmF0aW9uIGluIGFkdmFuY2Ug
YXQgdGhlIGJlZ2lubmluZw0KPiBvZiBkZXZpY2UgcHJvYmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBMYWRpc2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IC0tLQ0KPiAgQ0hBTkdF
UzoNCj4gIC0gdjQ6IG5ldyBwYXRjaA0KPiAgLSB2NTogdXNlIHVpbnRwdHJfdCBpbnN0ZWFkIG9m
IHU2NCB0byByZXR5cGUgYmFzZSBhZGRyZXNzIHRvIG1ha2UgMzJiaXQNCj4gICAgICAgIGNvbXBp
bGVycyBoYXBweS4NCj4gDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMgfCA5MCAr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNDMg
aW5zZXJ0aW9ucygrKSwgNDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLW9jdGVvbi5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9jdGVvbi5j
DQo+IGluZGV4IDI0ZTc1ODgxYjVjZi4uMGRjNDVkZGExMzRjIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2Mz
LW9jdGVvbi5jDQo+IEBAIC0xOTIsNiArMTkyLDggQEAgc3RydWN0IGR3YzNfb2N0ZW9uIHsNCj4g
IAl2b2lkIF9faW9tZW0gKmJhc2U7DQo+ICB9Ow0KPiAgDQo+ICsjZGVmaW5lIERXQzNfR1BJT19Q
T1dFUl9OT05FCSgtMSkNCj4gKw0KPiAgI2lmZGVmIENPTkZJR19DQVZJVU1fT0NURU9OX1NPQw0K
PiAgI2luY2x1ZGUgPGFzbS9vY3Rlb24vb2N0ZW9uLmg+DQo+ICBzdGF0aWMgaW5saW5lIHVpbnQ2
NF90IGR3YzNfb2N0ZW9uX3JlYWRxKHZvaWQgX19pb21lbSAqYWRkcikNCj4gQEAgLTI1OCw1NSAr
MjYwLDE1IEBAIHN0YXRpYyBpbnQgZHdjM19vY3Rlb25fZ2V0X2RpdmlkZXIodm9pZCkNCj4gIAly
ZXR1cm4gZGl2Ow0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgaW50IGR3YzNfb2N0ZW9uX2NvbmZpZ19w
b3dlcihzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgX19pb21lbSAqYmFzZSkNCj4gLXsNCj4gLQl1
aW50MzJfdCBncGlvX3B3clszXTsNCj4gLQlpbnQgZ3BpbywgbGVuLCBwb3dlcl9hY3RpdmVfbG93
Ow0KPiAtCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IGRldi0+b2Zfbm9kZTsNCj4gLQl1NjQg
dmFsOw0KPiAtCXZvaWQgX19pb21lbSAqdWN0bF9ob3N0X2NmZ19yZWcgPSBiYXNlICsgVVNCRFJE
X1VDVExfSE9TVF9DRkc7DQo+IC0NCj4gLQlpZiAob2ZfZmluZF9wcm9wZXJ0eShub2RlLCAicG93
ZXIiLCAmbGVuKSAhPSBOVUxMKSB7DQo+IC0JCWlmIChsZW4gPT0gMTIpIHsNCj4gLQkJCW9mX3By
b3BlcnR5X3JlYWRfdTMyX2FycmF5KG5vZGUsICJwb3dlciIsIGdwaW9fcHdyLCAzKTsNCj4gLQkJ
CXBvd2VyX2FjdGl2ZV9sb3cgPSBncGlvX3B3clsyXSAmIDB4MDE7DQo+IC0JCQlncGlvID0gZ3Bp
b19wd3JbMV07DQo+IC0JCX0gZWxzZSBpZiAobGVuID09IDgpIHsNCj4gLQkJCW9mX3Byb3BlcnR5
X3JlYWRfdTMyX2FycmF5KG5vZGUsICJwb3dlciIsIGdwaW9fcHdyLCAyKTsNCj4gLQkJCXBvd2Vy
X2FjdGl2ZV9sb3cgPSAwOw0KPiAtCQkJZ3BpbyA9IGdwaW9fcHdyWzFdOw0KPiAtCQl9IGVsc2Ug
ew0KPiAtCQkJZGV2X2VycihkZXYsICJpbnZhbGlkIHBvd2VyIGNvbmZpZ3VyYXRpb25cbiIpOw0K
PiAtCQkJcmV0dXJuIC1FSU5WQUw7DQo+IC0JCX0NCj4gLQkJZHdjM19vY3Rlb25fY29uZmlnX2dw
aW8oKCh1NjQpYmFzZSA+PiAyNCkgJiAxLCBncGlvKTsNCj4gLQ0KPiAtCQkvKiBFbmFibGUgWEhD
SSBwb3dlciBjb250cm9sIGFuZCBzZXQgaWYgYWN0aXZlIGhpZ2ggb3IgbG93LiAqLw0KPiAtCQl2
YWwgPSBkd2MzX29jdGVvbl9yZWFkcSh1Y3RsX2hvc3RfY2ZnX3JlZyk7DQo+IC0JCXZhbCB8PSBV
U0JEUkRfVUNUTF9IT1NUX1BQQ19FTjsNCj4gLQkJaWYgKHBvd2VyX2FjdGl2ZV9sb3cpDQo+IC0J
CQl2YWwgJj0gflVTQkRSRF9VQ1RMX0hPU1RfUFBDX0FDVElWRV9ISUdIX0VOOw0KPiAtCQllbHNl
DQo+IC0JCQl2YWwgfD0gVVNCRFJEX1VDVExfSE9TVF9QUENfQUNUSVZFX0hJR0hfRU47DQo+IC0J
CWR3YzNfb2N0ZW9uX3dyaXRlcSh1Y3RsX2hvc3RfY2ZnX3JlZywgdmFsKTsNCj4gLQl9IGVsc2Ug
ew0KPiAtCQkvKiBEaXNhYmxlIFhIQ0kgcG93ZXIgY29udHJvbCBhbmQgc2V0IGlmIGFjdGl2ZSBo
aWdoLiAqLw0KPiAtCQl2YWwgPSBkd2MzX29jdGVvbl9yZWFkcSh1Y3RsX2hvc3RfY2ZnX3JlZyk7
DQo+IC0JCXZhbCAmPSB+VVNCRFJEX1VDVExfSE9TVF9QUENfRU47DQo+IC0JCXZhbCAmPSB+VVNC
RFJEX1VDVExfSE9TVF9QUENfQUNUSVZFX0hJR0hfRU47DQo+IC0JCWR3YzNfb2N0ZW9uX3dyaXRl
cSh1Y3RsX2hvc3RfY2ZnX3JlZywgdmFsKTsNCj4gLQkJZGV2X2luZm8oZGV2LCAicG93ZXIgY29u
dHJvbCBkaXNhYmxlZFxuIik7DQo+IC0JfQ0KPiAtCXJldHVybiAwOw0KPiAtfQ0KPiAtDQo+IC1z
dGF0aWMgaW50IGR3YzNfb2N0ZW9uX2Nsb2Nrc19zdGFydChzdHJ1Y3QgZHdjM19vY3Rlb24gKm9j
dGVvbikNCj4gK3N0YXRpYyBpbnQgZHdjM19vY3Rlb25fc2V0dXAoc3RydWN0IGR3YzNfb2N0ZW9u
ICpvY3Rlb24sDQo+ICsJCQkgICAgIGludCBwb3dlcl9ncGlvLCBpbnQgcG93ZXJfYWN0aXZlX2xv
dykNCj4gIHsNCj4gIAlpbnQgaSwgZGl2LCBtcGxsX211bCwgcmVmX2Nsa19mc2VsLCByZWZfY2xr
X3NlbCA9IDI7DQo+ICAJdTMyIGNsb2NrX3JhdGU7DQo+ICAJdTY0IHZhbDsNCj4gIAlzdHJ1Y3Qg
ZGV2aWNlICpkZXYgPSBvY3Rlb24tPmRldjsNCj4gIAl2b2lkIF9faW9tZW0gKnVjdGxfY3RsX3Jl
ZyA9IG9jdGVvbi0+YmFzZSArIFVTQkRSRF9VQ1RMX0NUTDsNCj4gKwl2b2lkIF9faW9tZW0gKnVj
dGxfaG9zdF9jZmdfcmVnID0gb2N0ZW9uLT5iYXNlICsgVVNCRFJEX1VDVExfSE9TVF9DRkc7DQo+
ICANCj4gIAlpZiAoZGV2LT5vZl9ub2RlKSB7DQo+ICAJCWNvbnN0IGNoYXIgKnNzX2Nsb2NrX3R5
cGU7DQo+IEBAIC00NTQsOCArNDE2LDIxIEBAIHN0YXRpYyBpbnQgZHdjM19vY3Rlb25fY2xvY2tz
X3N0YXJ0KHN0cnVjdCBkd2MzX29jdGVvbiAqb2N0ZW9uKQ0KPiAgCXVkZWxheSgxMCk7DQo+ICAN
Cj4gIAkvKiBTdGVwIDhjOiBTZXR1cCBwb3dlciBjb250cm9sLiAqLw0KPiAtCWlmIChkd2MzX29j
dGVvbl9jb25maWdfcG93ZXIoZGV2LCBvY3Rlb24tPmJhc2UpKQ0KPiAtCQlyZXR1cm4gLUVJTlZB
TDsNCj4gKwl2YWwgPSBkd2MzX29jdGVvbl9yZWFkcSh1Y3RsX2hvc3RfY2ZnX3JlZyk7DQo+ICsJ
dmFsIHw9IFVTQkRSRF9VQ1RMX0hPU1RfUFBDX0VOOw0KPiArCWlmIChwb3dlcl9ncGlvID09IERX
QzNfR1BJT19QT1dFUl9OT05FKSB7DQo+ICsJCXZhbCAmPSB+VVNCRFJEX1VDVExfSE9TVF9QUENf
RU47DQo+ICsJfSBlbHNlIHsNCj4gKwkJdmFsIHw9IFVTQkRSRF9VQ1RMX0hPU1RfUFBDX0VOOw0K
PiArCQlkd2MzX29jdGVvbl9jb25maWdfZ3BpbygoKF9fZm9yY2UgdWludHB0cl90KW9jdGVvbi0+
YmFzZSA+PiAyNCkgJiAxLA0KPiArCQkJCQlwb3dlcl9ncGlvKTsNCg0KTGV0J3Mgbm90IGNhc3Qg
aXQgbGlrZSB0aGlzLiBJdCdzIG5vdCByZWFkYWJsZS4gTWFrZSB0aGUgbG9naWMNCmludGVudGlv
bmFsIGFuZCBjbGVhcjoNCmUuZy46IGludCBpbmRleCA9ICEhKG9jdGVvbi0+YmFzZSAmIEJJVCgy
NCkpOw0KZHdjM19vY3Rlb25fY29uZmlnX2dwaW8oaW5kZXgsIHBvd2VyX2dwaW8pOw0KDQpJdCdz
IG9kZCB0aGF0IHRoZSAiaW5kZXgiIGlzIGJlaW5nIHVzZWQgYXMgYm9vbGVhbiBoZXJlLg0KDQpS
ZWdhcmRsZXNzLCBJIGRvbid0IGtub3cgd2hhdCB0aGlzIG1hZ2ljIG9mZnNldCBCSVQoMjQpIG1l
YW5zLiBJZg0KdGhlcmUncyBzb21lIGNvbnRleHQsIHRoZW4geW91IGNhbiByZWZhY3RvciB0aGUN
CmR3YzNfb2N0ZW9uX2NvbmZpZ19ncGlvKCkgYXMgYmVsb3c6DQoNCmR3YzNfb2N0ZW9uX2NvbmZp
Z19ncGlvKHBvd2VyX2dwaW8sIGlzX2JpdDI0KSB3aGVyZSAiaXNfYml0MjQiIGlzIHNvbWUNCm90
aGVyIG1lYW5pbmdmdWwgYm9vbGVhbiBuYW1lLg0KDQoNCj4gKwkJZGV2X2RiZyhkZXYsICJwb3dl
ciBjb250cm9sIGlzIHVzaW5nIGdwaW8lZFxuIiwgcG93ZXJfZ3Bpbyk7DQo+ICsJfQ0KPiArCWlm
IChwb3dlcl9hY3RpdmVfbG93KQ0KPiArCQl2YWwgJj0gflVTQkRSRF9VQ1RMX0hPU1RfUFBDX0FD
VElWRV9ISUdIX0VOOw0KPiArCWVsc2UNCj4gKwkJdmFsIHw9IFVTQkRSRF9VQ1RMX0hPU1RfUFBD
X0FDVElWRV9ISUdIX0VOOw0KPiArCWR3YzNfb2N0ZW9uX3dyaXRlcSh1Y3RsX2hvc3RfY2ZnX3Jl
ZywgdmFsKTsNCj4gIA0KPiAgCS8qIFN0ZXAgOGQ6IERlYXNzZXJ0IFVBSEMgcmVzZXQgc2lnbmFs
LiAqLw0KPiAgCXZhbCA9IGR3YzNfb2N0ZW9uX3JlYWRxKHVjdGxfY3RsX3JlZyk7DQo+IEBAIC01
MDgsNyArNDgzLDI4IEBAIHN0YXRpYyBpbnQgZHdjM19vY3Rlb25fcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0K
PiAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IGRldi0+b2Zfbm9kZTsNCj4gIAlzdHJ1Y3Qg
ZHdjM19vY3Rlb24gKm9jdGVvbjsNCj4gLQlpbnQgZXJyOw0KPiArCWludCBwb3dlcl9hY3RpdmVf
bG93LCBwb3dlcl9ncGlvOw0KPiArCWludCBlcnIsIGxlbjsNCj4gKw0KPiArCXBvd2VyX2dwaW8g
PSBEV0MzX0dQSU9fUE9XRVJfTk9ORTsNCj4gKwlwb3dlcl9hY3RpdmVfbG93ID0gMDsNCj4gKwlp
ZiAob2ZfZmluZF9wcm9wZXJ0eShub2RlLCAicG93ZXIiLCAmbGVuKSkgew0KPiArCQl1MzIgZ3Bp
b19wd3JbM107DQo+ICsNCj4gKwkJc3dpdGNoIChsZW4pIHsNCj4gKwkJY2FzZSA4Og0KPiArCQkJ
b2ZfcHJvcGVydHlfcmVhZF91MzJfYXJyYXkobm9kZSwgInBvd2VyIiwgZ3Bpb19wd3IsIDIpOw0K
PiArCQkJYnJlYWs7DQo+ICsJCWNhc2UgMTI6DQo+ICsJCQlvZl9wcm9wZXJ0eV9yZWFkX3UzMl9h
cnJheShub2RlLCAicG93ZXIiLCBncGlvX3B3ciwgMyk7DQo+ICsJCQlwb3dlcl9hY3RpdmVfbG93
ID0gZ3Bpb19wd3JbMl0gJiAweDAxOw0KDQpJdCB3b3VsZCBiZSBiZXR0ZXIgZm9yIHRoZXNlIG1h
Z2ljIG51bWJlcnMgKGUuZy4gMHgwMSkgdG8gYmUgd3JpdHRlbiBpbg0KbWFjcm9zIG9yIGF0IGxl
YXN0IGRvY3VtZW50ZWQgaW4gdGhlIGZ1dHVyZS4gVGhhdCB1cGRhdGUgY2FuIGJlIGRvbmUgaW4N
CmEgc2VwYXJhdGUgY29tbWl0IGluIHRoZSBmdXR1cmUuDQoNCj4gKwkJCWJyZWFrOw0KPiArCQlk
ZWZhdWx0Og0KPiArCQkJZGV2X2VycihkZXYsICJpbnZhbGlkIHBvd2VyIGNvbmZpZ3VyYXRpb25c
biIpOw0KPiArCQkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJCX0NCj4gKwkJcG93ZXJfZ3BpbyA9IGdw
aW9fcHdyWzFdOw0KPiArCX0NCj4gIA0KPiAgCW9jdGVvbiA9IGRldm1fa3phbGxvYyhkZXYsIHNp
emVvZigqb2N0ZW9uKSwgR0ZQX0tFUk5FTCk7DQo+ICAJaWYgKCFvY3Rlb24pDQo+IEBAIC01MTks
NyArNTE1LDcgQEAgc3RhdGljIGludCBkd2MzX29jdGVvbl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiAgCWlmIChJU19FUlIob2N0ZW9uLT5iYXNlKSkNCj4gIAkJcmV0dXJu
IFBUUl9FUlIob2N0ZW9uLT5iYXNlKTsNCj4gIA0KPiAtCWVyciA9IGR3YzNfb2N0ZW9uX2Nsb2Nr
c19zdGFydChvY3Rlb24pOw0KPiArCWVyciA9IGR3YzNfb2N0ZW9uX3NldHVwKG9jdGVvbiwgcG93
ZXJfZ3BpbywgcG93ZXJfYWN0aXZlX2xvdyk7DQo+ICAJaWYgKGVycikNCj4gIAkJcmV0dXJuIGVy
cjsNCj4gIA0KPiAtLSANCj4gMi4zOS4yDQo+IA0KDQpUaGFua3MsDQpUaGluaA==

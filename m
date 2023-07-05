Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E78EC7491D8
	for <lists+linux-mips@lfdr.de>; Thu,  6 Jul 2023 01:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231669AbjGEX0T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Jul 2023 19:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231608AbjGEX0S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Jul 2023 19:26:18 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 828E8171A;
        Wed,  5 Jul 2023 16:26:16 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365GrVTG009302;
        Wed, 5 Jul 2023 16:25:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=y2rPXdRJdhq/g9Q5S931EXoSPOetAMpDr0zIf3svaFU=;
 b=aD1+7lm8cRxx1/9+2tZVUJd9NTt6eX/IEyCGA2p0cpo5KjvHSnTiIvVvlSUZFoGJFG7v
 zklhxx15m6+dsBm7joJO5khmeDqlZvN8J1E15MRMfCG8rhiWNa9LG903QoK98w1L2dAy
 Ux6oL4luxdUKBhqYUDuCoJyTvkcdD72v5pPuL6qVOlMsdhgcNpnMpjhCZ0Crw1BgUKx4
 03weZH/qcQtZUnIkT7U/A7JGMmbSsxhjvZB+viNzz9V8g1cLrYLRfJA6mzR+xSQHSzYF
 F5IwUeussSgRmaz1rmyRMk8LtxRQOwqce21K/wfjHp7xcsc8+MeLUpFcu5QUnhSd96D5 tA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3rjjsdtbk9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Jul 2023 16:25:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1688599556; bh=y2rPXdRJdhq/g9Q5S931EXoSPOetAMpDr0zIf3svaFU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=JdxoBIKMxIBnHpB+0693jokoKrYUXldzuLa6pZYMThpe+rZcwZFzcud8tFqlJYBI3
         c6zjVoFBccOXQJKXMDqAt4UaMa8Uc1cZSSzJo8Nk4zPCcduQ1Si480yFkdPbjsqV2X
         QjiVsUyh1rr9z7qeau7sa3TBXIM+VDRyKZJwy0i+We9RnPm9OaVYOpApVrI4vTJOCw
         EKb75P04Z892AtyuI5MseBXz9WsOhMkKYRP0lD9y/+udiv3VOHtw6YWuefaAey7ah6
         waK5wuv1cK7Q7jPDtBK6sI3NMeRi6Allt5t9pRiR+7QM1mIjw1mjX2XEzCGVonzyRC
         3X0r8eLfpxjtg==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8AD4B40682;
        Wed,  5 Jul 2023 23:25:56 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6E10FA0071;
        Wed,  5 Jul 2023 23:25:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=pMARtPpX;
        dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0811B4063A;
        Wed,  5 Jul 2023 23:25:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGmJnPUuD2guJIzGEjpQc4aJFXoTFd3drlDq7AJX7gq7KLyXvwxDkqMqQFLpSaXD4nIfuPXl6n9t4+4juAyUmpz/6YodLUnd6UYMSnevYpXB27R8NVK84OZzFCjGjo0NGD1crFncf6Gc759EudSN6ljK6fo3qjrONIjcW/AT1xO6oIZOYspy+JDGfQkx4FtBXFtiZ82gDCGorYXwzP1Kd0hRKa1FHCA3tWxlL0yvdFsX0RIDcHT19VX1LzAr2zBaAbfEOCbR75c2nkoo21ZVUVw28+F2Un4GGKo0D6gF5B4QVE1DglODCgV5Y38r7vkn4+0cNVLREoB1Cm3VNATy6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2rPXdRJdhq/g9Q5S931EXoSPOetAMpDr0zIf3svaFU=;
 b=hBmTQhdRgoKXriHRE9YYnGTHeTPn4QbKrpQ5H8MxnTH71C2dv4Upb7UD8o+hj8ehrM7P2vg5JEXCOwNbtC7dfkUtHv+cF3j99vnE8/tQ6NZefiYmDn+SWE215u2e2aQurs8IFIznusEy1KwUfWvPkdzbqnt6tCUzC6g2QFbUiwZLCaW5AeR1Zi1mD346bL7ZVXgjMHRCyDiY7OKpEQf1tOMFBbCdzlEtIWbOk1f6mUi5UPiXO9GmAj0yAqDAI+4UjBZZczLKHumHULR/wYNOagG3l3475TcUhH0tV7VMJeA3uNTjqc4GMq4x7sUTgFyfHlXv1CRdYZKfHOtSuBwbZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2rPXdRJdhq/g9Q5S931EXoSPOetAMpDr0zIf3svaFU=;
 b=pMARtPpXPgV8z/WUCjRzNfWxUEYILiG/3hVujkF4hsSzhtk45/ocSryPT9dPXHAA7N21kSSMt/SLTck3MwTDBs6iO17nEGpXnOGE7i89M1YcHe5BQS7t3vQMPCVxxMB3M+C3baB0gOKhaNtrucepi+QH3/LEaB5B5p5wAElk4eI=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MW4PR12MB7118.namprd12.prod.outlook.com (2603:10b6:303:213::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 23:25:46 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b%3]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 23:25:46 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] usb: dwc3: dwc3-octeon: Convert to glue driver
Thread-Topic: [PATCH v2 1/3] usb: dwc3: dwc3-octeon: Convert to glue driver
Thread-Index: AQHZrHptXm+dTI9vnEWniTbWzB+Uha+r1xGA
Date:   Wed, 5 Jul 2023 23:25:46 +0000
Message-ID: <20230705232541.wsutfrdx5ltp4rw3@synopsys.com>
References: <ZKDBiY6TKdDKIFK+@lenoch> <ZKDBxnAulDCQCgVX@lenoch>
In-Reply-To: <ZKDBxnAulDCQCgVX@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MW4PR12MB7118:EE_
x-ms-office365-filtering-correlation-id: e55c76d7-b5ff-48c6-3bf4-08db7daf2908
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ce028yFzRDZ0+57g77BwggZa9k8z4NXQk3GpPq9/fKs0KiCmUx9YMfsewQhgGf9ns7acJdJxWupdo91L0EE12n29eyxQCRQjSDuKqDLayC94oci7iVOZ8ImzFQgAsKXzRYccHihMEZJ/xgAZOf/0sFeU2f9PpQ0MoA6ptfR2oaTer5Q40J/HdOyPrcKUfK/g0GHZf2o9ONLO12oke8G5Y34f/asZV7x8fmguiL43RfTGsnFirsq3cRvgQKFWyQsxloemBQBQ6Bdw8DnYsy4wYqECiVUuiAv8p6lo3/+qfmMjHGCZuaD9Dmrk3xk6SmpcYQdR1TArDLz0gQxh3u8Kyr08c/XCfbOkUtacWTC5+a1Sc2OeVRyt5GYP4B5Pw9RPNJe5ZKaKyIuSiRdewvfpNImf1Uo8bskmnSkq4NV0luibnWC4f5qeVJJ3YZurhNWHIJ4+mChBlB/710NT0J9XV4byTQu4VyMoXvc2nHMCyOUBuWWPIubuiDOU0q+/zASqmPi+sl7+pd5ydWZEAPe4EbdJxgKmHW5zytsQ2FIn6Nce9Swf9wqF/xh/PLrLqQVRBvvKr221R8Bpm1NZvvYazJma/LWAKe1UvtboLVTA6foJalMAt9IDaFbqWkNiiUWN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(66556008)(5660300002)(8676002)(2616005)(2906002)(76116006)(8936002)(6506007)(1076003)(26005)(186003)(66446008)(41300700001)(122000001)(71200400001)(6486002)(91956017)(66476007)(4326008)(64756008)(316002)(66946007)(6916009)(36756003)(54906003)(38070700005)(478600001)(6512007)(38100700002)(86362001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmVUSklrUHVzR1lHR08rd2J2UXlXalBQUEdYWVNsWmJFblFKNHAwTlEvU0hY?=
 =?utf-8?B?UEUzQjB3T3ZreXNjNlZzWk1iN3lZY3F1MUdOZlRLQzMyMnlZZlhtcS8rcnBM?=
 =?utf-8?B?Ujd6b3ZLaXFyZ1J0UWxDMWFyZEg1OUZWbGZvaVVmZWFZYW1KRm0wV2FhUlJY?=
 =?utf-8?B?QXI1dTNJQXZyWFRRSWVubk16TTBnTE9MSzQxbXRaMDZKMXVkUEw5Vm9YOHdN?=
 =?utf-8?B?UlYrdzU4eTdrcGZwdEkwdS9HdENPVWp2SytaSzBWUnFObVJnTVJHY0hoTHgw?=
 =?utf-8?B?bTFhTkFsOFdRQ0NlSFRCTVhHYUljRDQyb1pCWlAyWHROMHlIYytrYjdGd3Ru?=
 =?utf-8?B?cEc0RTdpUFp3dkttb2JabzcwSkd1bWFLRThweFp1UitWNXZYOHhKa2ZhWHcw?=
 =?utf-8?B?Z0JFR0xnMkRjdWhNYTNaZzFNQnh1YXluUERaSGZ5eTc3eXg4MzhkVVp3SG1y?=
 =?utf-8?B?aFFwTnRyY212akQ4dlpMVy9aYkZrMXJvMlh6Ky9QTWVBSUc2ejc0Yyt4d3Q5?=
 =?utf-8?B?bGNCVUF1WDh5bzlKdjVqZ0cyZklrSDBYZjNvdFprZVQ3V3lJbDVSMHk2TnVF?=
 =?utf-8?B?eENqbnpUWnNsU3Y0WTYwMVRibFp4R0J0UnRQQkVaaXJKZjV5ZTk5SzZzbDFj?=
 =?utf-8?B?b2I4RTdPY1N0bVJpanJoMmJSTVFNOEZ2MmNRdmlJaVRUK0I5UzZ6dzV0TUh1?=
 =?utf-8?B?Q056eFgwbU9kdXZWS0lVcE81azVjSmRad3FocllRdmtOTldtK3dlS2w0SUw0?=
 =?utf-8?B?dHNlRnlZa1RPN1NpRC82Ymd2TUFiQzMxTFk2SWZmdEdpUVhscnRyZ2NpNGJY?=
 =?utf-8?B?Q0F4RmR0RU9tY09uUTFyemFseDd3Umc4RkpyUVNXNmV0Q0ZzSzYxOUdiTERo?=
 =?utf-8?B?eFZRWmM4cWUrZkx0WHI5R1lHdkkzUUNzT3R5bmVyZjFKT0pzVVhWU2pMemo0?=
 =?utf-8?B?R0pKZmwxVHRubXJLNlgzRkNXcXJuRktLbjMvSWRsbnV6Mi90NWY2VEtZYWs4?=
 =?utf-8?B?Z041U3pHb0ptVFp3ZVlIQ2JMYkUwcVE3M1NVYUJwV3hLaHUxRURKRlpJSXRk?=
 =?utf-8?B?SysvVS9qSVpGQVg3QXdrYmNyK0JCYURzMWY5VDl4eVFKd3JSK2UrTUdkTnNR?=
 =?utf-8?B?Y2lzVTBWR1hxUzFIWHRGY2FzQU9BTFJqMmNjUUVMNWsrT3Z0U3RWblovVFF0?=
 =?utf-8?B?WTRzSzVDakFkLzh3R2dQQTAvdFFXRmMzZzU1dy9aTURzNVdwbnVINlFyMUlL?=
 =?utf-8?B?V0NubUxaaGxEMnpVLzB1Y3hqQkQ0aHFYL05mOTFsREl1eEFBaVhOeWZkcmxI?=
 =?utf-8?B?NFZ3RG8yb2tmUWE0emhyWDhTeWpPbWw5RU9YVmI3RXdFbFJVY1FWQWVEQXYr?=
 =?utf-8?B?NGoxRXhLRkpTQWZNY0MwTHU1cGw0blZxWXk2YjJiR1NHNGYvUTlnMTRmRDhX?=
 =?utf-8?B?OEtoeXdkdjcyb3U5NnRyaURNblE5bmE2T0poeTJMQ1pnZ3gwT3RaVW1ka0Z6?=
 =?utf-8?B?ZDN5NnZyOS9WTVVvbXVEUXNkaWVjdFBQOERTVUlLYlVseVdJU0d6TGVUK0Nh?=
 =?utf-8?B?L1F4eVdtSnNsdjcvTHBtNXN2ZlpYakUwSm9tU25jbjRBa1RlTlNQUkdJOUFj?=
 =?utf-8?B?dXJIV1ZWRFd5QnlIcU5mVVBIc1l0MWdBSEMwN3RITE1QQXkwRmV0a2gvNzFi?=
 =?utf-8?B?ZG9RQVJ3a0c1dlZ1akRNZUliMC9OdDdSL3Vpa0lhbUhJRWt5S1ZYZlZqbTd0?=
 =?utf-8?B?RkNnbFRxWnVGUkRwQ1U4N3c5YTU2TENSbjEzUW1lUGY1WjVGalU4amxnUWt2?=
 =?utf-8?B?bGhIWm1ERzdGbVlheDBnWHhQby8wWWpRMWV1VXEwVnI0NGVLb0ZYdXF1dFFt?=
 =?utf-8?B?bDh3TGdCY2xzTkRxQWpDSzVXTnpZRVlwamxFMG9kbnhQd1NLa0VaTFlJeGwr?=
 =?utf-8?B?OFFJNFFIb0hnWFZodXh2THBxa0ZQR1RUdzZSWWJkNlMzYUNrZ2d0RXhqcWdF?=
 =?utf-8?B?WW1GZHRuSzlFZWJid2xTMVVsaXk1OXpwSys0UUM5b0dHM2c3RGIvZkxIdFVU?=
 =?utf-8?B?RE9GRFo0b2cxUmpMcWE0SlplaEJUSmk0eFBOcGlBanBYcUo4dHVTY0VyRkdV?=
 =?utf-8?Q?1VkmKh4wCEPBj0DQito/2W7Nu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A739B2B33818045BE40A61412EFD13F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?bGxkQXpPSklMWStBOVpBRlZoL3dWcEthUTNEQmZXY21IU1VHZ0FHYmlxSGxo?=
 =?utf-8?B?czV4dnBhR0ZiVlFaRGhqKzBWV0trOUVHbHN3cXp5YnA0aHhkdTluQWZQV3lK?=
 =?utf-8?B?OWRRNDg1UlBEbVJJdllhQVNxZlRWSWlLc1c2ZnpZT1A3dkI1d0FvU2U2dnVB?=
 =?utf-8?B?SENDbVFNZ3k3MWpVT2FwY2lFQXRieVV5Y0lYTHRlTDZwM2llQVZ2Q0FHRWNp?=
 =?utf-8?B?R1FDdmxjaUZUK1o1bXhXM3dPZTRyOGw1d3o5M2VkU2picTZWcENMSHNqVFpv?=
 =?utf-8?B?bGhkdFF6bVlET2k2aE1Dck9LdjhXd1pqQnBZeEJ4U1dmUXU4UjFOTlZsU2RP?=
 =?utf-8?B?VFRmSnlOV3BkQ05scEdoQUJwbXZuKytEa24waklGQmRSNFczdUljcGdrelRu?=
 =?utf-8?B?V2NMVkJPVDNkN05QN2NqWjJmTVlFUGl4QVFzT2ljUmNOK2t2MEVSTWNnSnVZ?=
 =?utf-8?B?OThHYzAyRzROcE15bWJVWHdMckQ5M2o1SEdsVDM3b1d3SmFBZ0FtM2g3czRK?=
 =?utf-8?B?R24xYTlUVlBNc1ZTaSswVXpPc3MvOENsMUFZUlk2ZzduRFRnTjdrdW5rS1RM?=
 =?utf-8?B?UzJVYm9FQ1JsMExsayt4d3dlUi9VbVpWZSs4SS9QN3dsRHVoOUUwTmdsWVVj?=
 =?utf-8?B?WTB3MG5mc01wZXo5eXBKSUlaN1ZuaEcyR01Pb25HUHZpL2hhSHl6R0VoZ2Vu?=
 =?utf-8?B?K2FnLy9PZkdOWXhSS2ovRCs3N0JTWTlEQWNZVGdXY3JXSDAzdURPU1hwd0tT?=
 =?utf-8?B?eWlpc2pvbFkreVNkQjJPUDVNeUZFYUIxcm03a2RYd05FcVlqc09qZWltNHBn?=
 =?utf-8?B?WUE1QmhmUktIcnIwdWFtcG0vcWJ1L0NKT1UrUjRHMXRXaGhiY1RtY3loT0No?=
 =?utf-8?B?UzF3eHdJeXFVamM4bGdjcXJFWGxSczNQU1V6SUtqVFFQV25iSFE2WWhveDBX?=
 =?utf-8?B?MFdML3FHaWpPaEFBc25EM1FnTXZab0RnVERMdkMrOWxXbXFxam9QWDk3b0c2?=
 =?utf-8?B?dzBFUVlZbmwwNFdSeDZXL0xSZDJ6dXdkM0txZGdBbTVrWmJXTUVwa1Jhdzla?=
 =?utf-8?B?aVYvY1VjeDJFS3htVzNkdTNGdXM5d25MblMrdm5OaU9BOVVXTG81d3ZOR1o5?=
 =?utf-8?B?UGdvRVdKQzhkVTFJc1VnK3NVWTlNSlAvZkJ4UXRhYmw0M0VJRGtRWGFMeVpu?=
 =?utf-8?B?TCtlYzlEaXJEalFhNUc3eWEyMkJUQVh5b1FDRVhhNUdORWg5dnRJN2wvclph?=
 =?utf-8?Q?ZQIembL7TgJfCEy?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e55c76d7-b5ff-48c6-3bf4-08db7daf2908
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2023 23:25:46.3796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5iDfhsx433PFxrWCYpyNe3szCNpUXtfuPCsrs0eNmUeleE/tnoMW+ccE5ZY/f/PqJwgodHTgIB9qnmZKS4iG7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7118
X-Proofpoint-ORIG-GUID: XPYhQNRR4HdjRVoIhUnOdIYJObGLqsEt
X-Proofpoint-GUID: XPYhQNRR4HdjRVoIhUnOdIYJObGLqsEt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_11,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0
 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2307050212
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gU3VuLCBKdWwgMDIsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBGcm9tOiBMYWRp
c2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IA0KPiBNb3ZlIE9jdGVvbiBEV0Mz
IGdsdWUgY29kZSBmcm9tIGFyY2gvbWlwcyBhbmQgdXNlIGl0DQo+IGluc3RlYWQgb2YgZHdjMy1v
Zi1zaW1wbGUuDQoNClBsZWFzZSBwcm92aWRlIG1vcmUgY29udGV4dCBhbmQgdGhlIHJlYXNvbiB0
byB3aHkgdGhlIG1vdmUgaGVyZS4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGFkaXNsYXYgTWlj
aGwgPGxhZGlzQGxpbnV4LW1pcHMub3JnPg0KPiBBY2tlZC1ieTogVGhvbWFzIEJvZ2VuZG9lcmZl
ciA8dHNib2dlbmRAYWxwaGEuZnJhbmtlbi5kZT4NCj4gLS0tDQo+ICBDSEFOR0VTOg0KPiAgLSB2
Mjogc3F1YXNoZWQgbW92ZSBhbmQgZ2x1ZSBjb252ZXJzaW9uIHBhdGNoLCBmaXhlZCBzcGFyc2Ug
d2FybmluZw0KPiAgICAgICAgYW5kIGZvcm1hdHRpbmcgaXNzdWUuIFNldCBwcml2YXRlIGRhdGEg
YXQgdGhlIGVuZCBvZiBwcm9iZS4NCj4gICAgICAgIENsZWFyIGRydmRhdGEgb24gcmVtb3ZlLiBB
ZGRlZCBob3N0IG1vZGUgb25seSBub3RpY2UuDQo+ICAgICAgICBDb2xsZWN0ZWQgYWNrIGZvciBt
b3ZlIGZyb20gYXJjaC9taXBzLg0KPiANCj4gIGFyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL01ha2Vm
aWxlICAgICAgICAgICAgICB8ICAgMSAtDQo+ICBhcmNoL21pcHMvY2F2aXVtLW9jdGVvbi9vY3Rl
b24tcGxhdGZvcm0uYyAgICAgfCAgIDEgLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9LY29uZmlnICAg
ICAgICAgICAgICAgICAgICAgIHwgIDEwICsrDQo+ICBkcml2ZXJzL3VzYi9kd2MzL01ha2VmaWxl
ICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiAgLi4uL3VzYi9kd2MzL2R3YzMtb2N0ZW9u
LmMgICAgICAgICAgICAgICAgICAgIHwgMTA4ICsrKysrKysrKystLS0tLS0tLQ0KPiAgZHJpdmVy
cy91c2IvZHdjMy9kd2MzLW9mLXNpbXBsZS5jICAgICAgICAgICAgIHwgICAxIC0NCj4gIDYgZmls
ZXMgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKSwgNTMgZGVsZXRpb25zKC0pDQo+ICByZW5hbWUg
YXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vb2N0ZW9uLXVzYi5jID0+IGRyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1vY3Rlb24uYyAoOTElKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9jYXZpdW0t
b2N0ZW9uL01ha2VmaWxlIGIvYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vTWFrZWZpbGUNCj4gaW5k
ZXggN2MwMmU1NDI5NTlhLi4yYTU5MjY1Nzg4NDEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvbWlwcy9j
YXZpdW0tb2N0ZW9uL01ha2VmaWxlDQo+ICsrKyBiL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL01h
a2VmaWxlDQo+IEBAIC0xOCw0ICsxOCwzIEBAIG9iai15ICs9IGNyeXB0by8NCj4gIG9iai0kKENP
TkZJR19NVEQpCQkgICAgICArPSBmbGFzaF9zZXR1cC5vDQo+ICBvYmotJChDT05GSUdfU01QKQkJ
ICAgICAgKz0gc21wLm8NCj4gIG9iai0kKENPTkZJR19PQ1RFT05fSUxNKQkgICAgICArPSBvY3Rf
aWxtLm8NCj4gLW9iai0kKENPTkZJR19VU0IpCQkgICAgICArPSBvY3Rlb24tdXNiLm8NCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL29jdGVvbi1wbGF0Zm9ybS5jIGIvYXJj
aC9taXBzL2Nhdml1bS1vY3Rlb24vb2N0ZW9uLXBsYXRmb3JtLmMNCj4gaW5kZXggY2UwNWMwZGQz
YWNkLi4yMzVjNzdjZTdiMTggMTAwNjQ0DQo+IC0tLSBhL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9u
L29jdGVvbi1wbGF0Zm9ybS5jDQo+ICsrKyBiL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL29jdGVv
bi1wbGF0Zm9ybS5jDQo+IEBAIC00NTAsNyArNDUwLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgb2N0ZW9uX2lkc1tdIF9faW5pdGNvbnN0ID0gew0KPiAgCXsgLmNvbXBhdGli
bGUgPSAiY2F2aXVtLG9jdGVvbi0zODYwLWJvb3RidXMiLCB9LA0KPiAgCXsgLmNvbXBhdGlibGUg
PSAiY2F2aXVtLG1kaW8tbXV4IiwgfSwNCj4gIAl7IC5jb21wYXRpYmxlID0gImdwaW8tbGVkcyIs
IH0sDQo+IC0JeyAuY29tcGF0aWJsZSA9ICJjYXZpdW0sb2N0ZW9uLTcxMzAtdXNiLXVjdGwiLCB9
LA0KPiAgCXt9LA0KPiAgfTsNCj4gIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9L
Y29uZmlnIGIvZHJpdmVycy91c2IvZHdjMy9LY29uZmlnDQo+IGluZGV4IGJlOTU0YTlhYmJlMC4u
OThlZmNiYjc2Yzg4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL0tjb25maWcNCj4g
KysrIGIvZHJpdmVycy91c2IvZHdjMy9LY29uZmlnDQo+IEBAIC0xNjgsNCArMTY4LDE0IEBAIGNv
bmZpZyBVU0JfRFdDM19BTTYyDQo+ICAJICBUaGUgRGVzaWdud2FyZSBDb3JlIFVTQjMgSVAgaXMg
cHJvZ3JhbW1lZCB0byBvcGVyYXRlIGluDQo+ICAJICBpbiBVU0IgMi4wIG1vZGUgb25seS4NCj4g
IAkgIFNheSAnWScgb3IgJ00nIGhlcmUgaWYgeW91IGhhdmUgb25lIHN1Y2ggZGV2aWNlDQo+ICsN
Cj4gK2NvbmZpZyBVU0JfRFdDM19PQ1RFT04NCj4gKwl0cmlzdGF0ZSAiQ2F2aXVtIE9jdGVvbiBQ
bGF0Zm9ybXMiDQo+ICsJZGVwZW5kcyBvbiBDQVZJVU1fT0NURU9OX1NPQyB8fCBDT01QSUxFX1RF
U1QNCj4gKwlkZWZhdWx0IFVTQl9EV0MzDQo+ICsJaGVscA0KPiArCSAgU3VwcG9ydCBDYXZpdW0g
T2N0ZW9uIHBsYXRmb3JtcyB3aXRoIERlc2lnbldhcmUgQ29yZSBVU0IzIElQLg0KPiArCSAgT25s
eSB0aGUgaG9zdCBtb2RlIGlzIGN1cnJlbnRseSBzdXBwb3J0ZWQuDQo+ICsJICBTYXkgJ1knIG9y
ICdNJyBoZXJlIGlmIHlvdSBoYXZlIG9uZSBzdWNoIGRldmljZS4NCj4gKw0KPiAgZW5kaWYNCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvTWFrZWZpbGUgYi9kcml2ZXJzL3VzYi9kd2Mz
L01ha2VmaWxlDQo+IGluZGV4IDlmNjZiZDgyYjYzOS4uZmUxNDkzZDRiYmU1IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL3VzYi9kd2MzL01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMv
TWFrZWZpbGUNCj4gQEAgLTU0LDMgKzU0LDQgQEAgb2JqLSQoQ09ORklHX1VTQl9EV0MzX1NUKQkJ
Kz0gZHdjMy1zdC5vDQo+ICBvYmotJChDT05GSUdfVVNCX0RXQzNfUUNPTSkJCSs9IGR3YzMtcWNv
bS5vDQo+ICBvYmotJChDT05GSUdfVVNCX0RXQzNfSU1YOE1QKQkJKz0gZHdjMy1pbXg4bXAubw0K
PiAgb2JqLSQoQ09ORklHX1VTQl9EV0MzX1hJTElOWCkJCSs9IGR3YzMteGlsaW54Lm8NCj4gK29i
ai0kKENPTkZJR19VU0JfRFdDM19PQ1RFT04pCQkrPSBkd2MzLW9jdGVvbi5vDQo+IGRpZmYgLS1n
aXQgYS9hcmNoL21pcHMvY2F2aXVtLW9jdGVvbi9vY3Rlb24tdXNiLmMgYi9kcml2ZXJzL3VzYi9k
d2MzL2R3YzMtb2N0ZW9uLmMNCj4gc2ltaWxhcml0eSBpbmRleCA5MSUNCj4gcmVuYW1lIGZyb20g
YXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vb2N0ZW9uLXVzYi5jDQo+IHJlbmFtZSB0byBkcml2ZXJz
L3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMNCj4gaW5kZXggMmFkZDQzNWFkMDM4Li44ZDVmYWNkODgx
YzEgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvbWlwcy9jYXZpdW0tb2N0ZW9uL29jdGVvbi11c2IuYw0K
PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMNCj4gQEAgLTE4Nyw3ICsxODcs
MTAgQEANCj4gICNkZWZpbmUgVVNCRFJEX1VDVExfRUNDCQkJCTB4ZjANCj4gICNkZWZpbmUgVVNC
RFJEX1VDVExfU1BBUkUxCQkJMHhmOA0KPiAgDQo+IC1zdGF0aWMgREVGSU5FX01VVEVYKGR3YzNf
b2N0ZW9uX2Nsb2Nrc19tdXRleCk7DQo+ICtzdHJ1Y3QgZHdjM19kYXRhIHsNCj4gKwlzdHJ1Y3Qg
ZGV2aWNlICpkZXY7DQo+ICsJdm9pZCBfX2lvbWVtICpiYXNlOw0KPiArfTsNCj4gIA0KPiAgI2lm
ZGVmIENPTkZJR19DQVZJVU1fT0NURU9OX1NPQw0KPiAgI2luY2x1ZGUgPGFzbS9vY3Rlb24vb2N0
ZW9uLmg+DQo+IEBAIC0yMzMsNiArMjM2LDExIEBAIHN0YXRpYyBpbmxpbmUgdWludDY0X3QgZHdj
M19vY3Rlb25fcmVhZHEodm9pZCBfX2lvbWVtICphZGRyKQ0KPiAgc3RhdGljIGlubGluZSB2b2lk
IGR3YzNfb2N0ZW9uX3dyaXRlcSh2b2lkIF9faW9tZW0gKmJhc2UsIHVpbnQ2NF90IHZhbCkgeyB9
DQo+ICANCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBkd2MzX29jdGVvbl9jb25maWdfZ3BpbyhpbnQg
aW5kZXgsIGludCBncGlvKSB7IH0NCj4gKw0KPiArc3RhdGljIHVpbnQ2NF90IG9jdGVvbl9nZXRf
aW9fY2xvY2tfcmF0ZSh2b2lkKQ0KPiArew0KPiArCXJldHVybiAxNTAwMDAwMDA7DQo+ICt9DQo+
ICAjZW5kaWYNCj4gIA0KPiAgc3RhdGljIGludCBkd2MzX29jdGVvbl9nZXRfZGl2aWRlcih2b2lk
KQ0KPiBAQCAtMjcxLDcgKzI3OSw3IEBAIHN0YXRpYyBpbnQgZHdjM19vY3Rlb25fY29uZmlnX3Bv
d2VyKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCBfX2lvbWVtICpiYXNlKQ0KPiAgCQkJZGV2X2Vy
cihkZXYsICJpbnZhbGlkIHBvd2VyIGNvbmZpZ3VyYXRpb25cbiIpOw0KPiAgCQkJcmV0dXJuIC1F
SU5WQUw7DQo+ICAJCX0NCj4gLQkJZHdjM19vY3Rlb25fY29uZmlnX2dwaW8oKCh1NjQpYmFzZSA+
PiAyNCkgJiAxLCBncGlvKTsNCj4gKwkJZHdjM19vY3Rlb25fY29uZmlnX2dwaW8oKChfX2ZvcmNl
IHU2NCliYXNlID4+IDI0KSAmIDEsIGdwaW8pOw0KDQpZb3UncmUgZG9pbmcgbW9yZSB0aGFuIGp1
c3QgbW92aW5nIHRoZSBjb2RlIGhlcmUuIFBsZWFzZSBzZXBhcmF0ZSB0aGUNCmNoYW5nZSB0byBh
IGRpZmZlcmVudCBwYXRjaCBpZiB0aGVyZSBhcmUgYWRkaXRpb25hbCBmdW5jdGlvbmFsIGNoYW5n
ZQ0KYW5kIHByb3ZpZGUgdGhlIHJlYXNvbiBmb3IgaXQuDQoNCj4gIA0KPiAgCQkvKiBFbmFibGUg
WEhDSSBwb3dlciBjb250cm9sIGFuZCBzZXQgaWYgYWN0aXZlIGhpZ2ggb3IgbG93LiAqLw0KPiAg
CQl2YWwgPSBkd2MzX29jdGVvbl9yZWFkcSh1Y3RsX2hvc3RfY2ZnX3JlZyk7DQo+IEBAIC0zODMs
NyArMzkxLDcgQEAgc3RhdGljIGludCBkd2MzX29jdGVvbl9jbG9ja3Nfc3RhcnQoc3RydWN0IGRl
dmljZSAqZGV2LCB2b2lkIF9faW9tZW0gKmJhc2UpDQo+ICAJaWYgKChkaXYgIT0gRklFTERfR0VU
KFVTQkRSRF9VQ1RMX0NUTF9IX0NMS0RJVl9TRUwsIHZhbCkpIHx8DQo+ICAJICAgICghKEZJRUxE
X0dFVChVU0JEUkRfVUNUTF9DVExfSF9DTEtfRU4sIHZhbCkpKSkgew0KPiAgCQlkZXZfZXJyKGRl
diwgImR3YzMgY29udHJvbGxlciBjbG9jayBpbml0IGZhaWx1cmUuXG4iKTsNCj4gLQkJCXJldHVy
biAtRUlOVkFMOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCg0KQXZvaWQgbWl4aW5nIGNsZWFudXAg
Y2hhbmdlIHdpdGggZnVuY3Rpb25hbCBjaGFuZ2UuDQoNCj4gIAl9DQo+ICANCj4gIAkvKiBTdGVw
IDRjOiBEZWFzc2VydCB0aGUgY29udHJvbGxlciBjbG9jayBkaXZpZGVyIHJlc2V0LiAqLw0KPiBA
QCAtNDk0LDU4ICs1MDIsNTggQEAgc3RhdGljIHZvaWQgX19pbml0IGR3YzNfb2N0ZW9uX3BoeV9y
ZXNldCh2b2lkIF9faW9tZW0gKmJhc2UpDQo+ICAJZHdjM19vY3Rlb25fd3JpdGVxKHVjdGxfY3Rs
X3JlZywgdmFsKTsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIGludCBfX2luaXQgZHdjM19vY3Rlb25f
ZGV2aWNlX2luaXQodm9pZCkNCj4gK3N0YXRpYyBpbnQgZHdjM19vY3Rlb25fcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gLQljb25zdCBjaGFyIGNvbXBhdF9ub2Rl
X25hbWVbXSA9ICJjYXZpdW0sb2N0ZW9uLTcxMzAtdXNiLXVjdGwiOw0KPiAtCXN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXY7DQo+IC0Jc3RydWN0IGRldmljZV9ub2RlICpub2RlOw0KPiAtCXN0
cnVjdCByZXNvdXJjZSAqcmVzOw0KPiAtCXZvaWQgX19pb21lbSAqYmFzZTsNCj4gKwlzdHJ1Y3Qg
ZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiArCXN0cnVjdCBkd2MzX2RhdGEgKmRhdGE7DQo+
ICsJaW50IGVycjsNCj4gIA0KPiAtCS8qDQo+IC0JICogVGhlcmUgc2hvdWxkIG9ubHkgYmUgdGhy
ZWUgdW5pdmVyc2FsIGNvbnRyb2xsZXJzLCAidWN0bCINCj4gLQkgKiBpbiB0aGUgZGV2aWNlIHRy
ZWUuIFR3byBVU0IgYW5kIGEgU0FUQSwgd2hpY2ggd2UgaWdub3JlLg0KPiAtCSAqLw0KPiAtCW5v
ZGUgPSBOVUxMOw0KPiAtCWRvIHsNCj4gLQkJbm9kZSA9IG9mX2ZpbmRfbm9kZV9ieV9uYW1lKG5v
ZGUsICJ1Y3RsIik7DQo+IC0JCWlmICghbm9kZSkNCj4gLQkJCXJldHVybiAtRU5PREVWOw0KPiAt
DQo+IC0JCWlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShub2RlLCBjb21wYXRfbm9kZV9uYW1l
KSkgew0KPiAtCQkJcGRldiA9IG9mX2ZpbmRfZGV2aWNlX2J5X25vZGUobm9kZSk7DQo+IC0JCQlp
ZiAoIXBkZXYpDQo+IC0JCQkJcmV0dXJuIC1FTk9ERVY7DQo+IC0NCj4gLQkJCS8qDQo+IC0JCQkg
KiBUaGUgY29kZSBiZWxvdyBtYXBzIGluIHRoZSByZWdpc3RlcnMgbmVjZXNzYXJ5IGZvcg0KPiAt
CQkJICogc2V0dGluZyB1cCB0aGUgY2xvY2tzIGFuZCByZXNldGluZyBQSFlzLiBXZSBtdXN0DQo+
IC0JCQkgKiByZWxlYXNlIHRoZSByZXNvdXJjZXMgc28gdGhlIGR3YzMgc3Vic3lzdGVtIGRvZXNu
J3QNCj4gLQkJCSAqIGtub3cgdGhlIGRpZmZlcmVuY2UuDQo+IC0JCQkgKi8NCj4gLQkJCWJhc2Ug
PSBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwLCAmcmVzKTsN
Cj4gLQkJCWlmIChJU19FUlIoYmFzZSkpIHsNCj4gLQkJCQlwdXRfZGV2aWNlKCZwZGV2LT5kZXYp
Ow0KPiAtCQkJCXJldHVybiBQVFJfRVJSKGJhc2UpOw0KPiAtCQkJfQ0KPiArCWRhdGEgPSBkZXZt
X2t6YWxsb2MoZGV2LCBzaXplb2YoKmRhdGEpLCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIWRhdGEp
DQo+ICsJCXJldHVybiAtRU5PTUVNOw0KPiAgDQo+IC0JCQltdXRleF9sb2NrKCZkd2MzX29jdGVv
bl9jbG9ja3NfbXV0ZXgpOw0KPiAtCQkJaWYgKGR3YzNfb2N0ZW9uX2Nsb2Nrc19zdGFydCgmcGRl
di0+ZGV2LCBiYXNlKSA9PSAwKQ0KPiAtCQkJCWRldl9pbmZvKCZwZGV2LT5kZXYsICJjbG9ja3Mg
aW5pdGlhbGl6ZWQuXG4iKTsNCj4gLQkJCWR3YzNfb2N0ZW9uX3NldF9lbmRpYW5fbW9kZShiYXNl
KTsNCj4gLQkJCWR3YzNfb2N0ZW9uX3BoeV9yZXNldChiYXNlKTsNCj4gLQkJCW11dGV4X3VubG9j
aygmZHdjM19vY3Rlb25fY2xvY2tzX211dGV4KTsNCj4gLQkJCWRldm1faW91bm1hcCgmcGRldi0+
ZGV2LCBiYXNlKTsNCj4gLQkJCWRldm1fcmVsZWFzZV9tZW1fcmVnaW9uKCZwZGV2LT5kZXYsIHJl
cy0+c3RhcnQsDQo+IC0JCQkJCQlyZXNvdXJjZV9zaXplKHJlcykpOw0KPiAtCQkJcHV0X2Rldmlj
ZSgmcGRldi0+ZGV2KTsNCj4gLQkJfQ0KPiAtCX0gd2hpbGUgKG5vZGUgIT0gTlVMTCk7DQo+ICsJ
ZGF0YS0+YmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsNCj4g
KwlpZiAoSVNfRVJSKGRhdGEtPmJhc2UpKQ0KPiArCQlyZXR1cm4gUFRSX0VSUihkYXRhLT5iYXNl
KTsNCj4gIA0KPiAtCXJldHVybiAwOw0KPiArCWVyciA9IGR3YzNfb2N0ZW9uX2Nsb2Nrc19zdGFy
dChkZXYsIGRhdGEtPmJhc2UpOw0KPiArCWlmIChlcnIpDQo+ICsJCXJldHVybiBlcnI7DQo+ICsN
Cj4gKwlkd2MzX29jdGVvbl9zZXRfZW5kaWFuX21vZGUoZGF0YS0+YmFzZSk7DQo+ICsJZHdjM19v
Y3Rlb25fcGh5X3Jlc2V0KGRhdGEtPmJhc2UpOw0KPiArDQo+ICsJZGF0YS0+ZGV2ID0gZGV2Ow0K
PiArCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGRhdGEpOw0KPiArDQo+ICsJcmV0dXJuIG9m
X3BsYXRmb3JtX3BvcHVsYXRlKG5vZGUsIE5VTEwsIE5VTEwsIGRldik7DQo+ICt9DQo+ICsNCj4g
K3N0YXRpYyB2b2lkIGR3YzNfb2N0ZW9uX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQ0KPiArew0KPiArCXN0cnVjdCBkd2MzX2RhdGEgKmRhdGEgPSBwbGF0Zm9ybV9nZXRfZHJ2
ZGF0YShwZGV2KTsNCj4gKw0KPiArCW9mX3BsYXRmb3JtX2RlcG9wdWxhdGUoZGF0YS0+ZGV2KTsN
Cj4gKwlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBOVUxMKTsNCj4gIH0NCj4gLWRldmljZV9p
bml0Y2FsbChkd2MzX29jdGVvbl9kZXZpY2VfaW5pdCk7DQo+ICANCj4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3YzNfb2N0ZW9uX29mX21hdGNoW10gPSB7DQo+ICsJeyAuY29t
cGF0aWJsZSA9ICJjYXZpdW0sb2N0ZW9uLTcxMzAtdXNiLXVjdGwiIH0sDQo+ICsJeyB9LA0KPiAr
fTsNCj4gK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGR3YzNfb2N0ZW9uX29mX21hdGNoKTsNCj4g
Kw0KPiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZHdjM19vY3Rlb25fZHJpdmVyID0g
ew0KPiArCS5wcm9iZQkJPSBkd2MzX29jdGVvbl9wcm9iZSwNCj4gKwkucmVtb3ZlX25ldwk9IGR3
YzNfb2N0ZW9uX3JlbW92ZSwNCj4gKwkuZHJpdmVyCQk9IHsNCj4gKwkJLm5hbWUJPSAiZHdjMy1v
Y3Rlb24iLA0KPiArCQkub2ZfbWF0Y2hfdGFibGUgPSBkd2MzX29jdGVvbl9vZl9tYXRjaCwNCj4g
Kwl9LA0KPiArfTsNCj4gK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoZHdjM19vY3Rlb25fZHJpdmVy
KTsNCj4gKw0KPiArTU9EVUxFX0FMSUFTKCJwbGF0Zm9ybTpkd2MzLW9jdGVvbiIpOw0KPiAgTU9E
VUxFX0FVVEhPUigiRGF2aWQgRGFuZXkgPGRhdmlkLmRhbmV5QGNhdml1bS5jb20+Iik7DQo+ICBN
T0RVTEVfTElDRU5TRSgiR1BMIik7DQo+IC1NT0RVTEVfREVTQ1JJUFRJT04oIlVTQiBkcml2ZXIg
Zm9yIE9DVEVPTiBJSUkgU29DIik7DQo+ICtNT0RVTEVfREVTQ1JJUFRJT04oIkRlc2lnbldhcmUg
VVNCMyBPQ1RFT04gSUlJIEdsdWUgTGF5ZXIiKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L2R3YzMvZHdjMy1vZi1zaW1wbGUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vZi1zaW1wbGUu
Yw0KPiBpbmRleCA3MWZkNjIwYzUxNjEuLmUzNDIzZmJlYTNlZCAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy91c2IvZHdjMy9kd2MzLW9mLXNpbXBsZS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1vZi1zaW1wbGUuYw0KPiBAQCAtMTcyLDcgKzE3Miw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZGV2X3BtX29wcyBkd2MzX29mX3NpbXBsZV9kZXZfcG1fb3BzID0gew0KPiAgDQo+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBvZl9kd2MzX3NpbXBsZV9tYXRjaFtdID0gew0K
PiAgCXsgLmNvbXBhdGlibGUgPSAicm9ja2NoaXAscmszMzk5LWR3YzMiIH0sDQo+IC0JeyAuY29t
cGF0aWJsZSA9ICJjYXZpdW0sb2N0ZW9uLTcxMzAtdXNiLXVjdGwiIH0sDQo+ICAJeyAuY29tcGF0
aWJsZSA9ICJzcHJkLHNjOTg2MC1kd2MzIiB9LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAiYWxsd2lu
bmVyLHN1bjUwaS1oNi1kd2MzIiB9LA0KPiAgCXsgLmNvbXBhdGlibGUgPSAiaGlzaWxpY29uLGhp
MzY3MC1kd2MzIiB9LA0KPiAtLSANCj4gMi4zOS4yDQo+IA0KDQpUaGFua3MsDQpUaGluaA==

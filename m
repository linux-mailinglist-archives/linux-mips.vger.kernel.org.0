Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF9A774F77
	for <lists+linux-mips@lfdr.de>; Wed,  9 Aug 2023 01:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjHHXlf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 19:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjHHXle (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 19:41:34 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BAD3198D;
        Tue,  8 Aug 2023 16:41:33 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 378KsD8k011561;
        Tue, 8 Aug 2023 16:41:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=TNzDBA9UVOSxNg5ir2hd0DaOsX5ltYX3JQOetZ/cfA0=;
 b=SbDPIuHYh2uHFj3GinrChtunuhBgm/cCZcLb5x5dssKiQZcOpsbzvEXGIFzYxuDNBJRG
 D1+GWX6oxMjdy/n115dVDoHyyYaoY6ZkJfgcMZujLvBR+dey43H0B2yICpJfcwOpl6zN
 uM2S3tX2BCn74SNDS6UMDznUPCVVT/MdZYDZC5oH3C/qQw+P6vIIXVe37CKneQLz0Rf3
 eVYwk1ZGRR6EmqUGEi4lks/Ii6kE1kCAQ/uvVwoaQ8BH1ejilLJCzE85KVYkEybpx3Oq
 fuSwW15ZK7hQH6w+DBNfpYambYdtyPxxPOe0ykCP6/4BjDp2M7clquxRUNp9pRl2yElX eA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3s9n2f7h0j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Aug 2023 16:41:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1691538082; bh=TNzDBA9UVOSxNg5ir2hd0DaOsX5ltYX3JQOetZ/cfA0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=LYJm2xLim3UkAdVeLOrrjcqy9BlNR6CCoGZUXfIdevGrrJbGgGV+nTkDewvsNVXXR
         q4epEjP4aRNH+kKWI+37UMRCFlE2a8Z8vuorlajyCgaYpidZg9J//aJ9yExQ6swh5m
         Yp8DDV/EWB8Sd4PvhmSOSKgqA87pH6R8muMnhlCHHe7uhQ/7xEBhFe0QtM6MbRYgbR
         9uSq/QpMMeywVl6xzO8LadUCd41wDMAFPmeXwbsSxqQHtRtdNWVMak5jsdRIC9zWFT
         O6gL/Gv0g2PNUKtI71fqRc041/Vq+tu6gmOl8o+/THwYhznppp4NjWj3U8gbp/ZZ7g
         Vhc9R+qyFPEPg==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F279040145;
        Tue,  8 Aug 2023 23:41:20 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4FDA3A0080;
        Tue,  8 Aug 2023 23:41:15 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=nhdJ9LLs;
        dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0BEDF40520;
        Tue,  8 Aug 2023 23:41:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffrjOjwU6pLijlKihOK8PJEO9oLt1HGCXefMNVZDYsagTRUpxLH1oSRURuGgXwhkGMusPIiEvki7Qpmy2uxt1YYIBRCvorZfUIGA7zbCjo5XWu1hZ2IvA+92A6o0f1ndu2MYw9a1Lg14dsqgUu5pA7KnYY7Rsf8Y5pf5Ka6oBPMNq4DKUrNsYGo/LX0Utf487CAuwfgeyIAuLHZ9boWfUlzw6RrUeGhWcJcR8XcclSXCIodZsl5ET4Kd/817VNSxW+Q5iM9eDa5oCQawKewsfck+5vkWWk0RZv1XGmhSNdzBEngEGQekC1Yxy6BBfAnWCc4JeKaWb08uL9Me7keNEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNzDBA9UVOSxNg5ir2hd0DaOsX5ltYX3JQOetZ/cfA0=;
 b=ghmwX35LLUsNBYZxZG4EtbM3rCbUJbDTj+BjddKBkJNduCRde2oGDXMyzrYpMyeD2nyD7hxtVQNeIXyaNrdMn92IVgdaEwA3XU01n7j7mhTlxGprGfBhYwi9TBS6qWCNZn+6zDBa4EumtHjmj4OuEvjd4x8JbG75OFOoC3jQEMvyqft6CJ6MuLCjstdMDaAkjVLYQ8RC4lhESTm6qsBVam327B4r6cX5auaR1r+s2kk6Bhu5iMAeO2yrskqcORPtlqQYJtv0Z2DL/bYd0eD8Ep0jxMgGxtOD0VaO2AIfrZeYDys/yFr44aX0JKeSuWNnq6jYx6HUOl2BddxuJk5GNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNzDBA9UVOSxNg5ir2hd0DaOsX5ltYX3JQOetZ/cfA0=;
 b=nhdJ9LLs6ffff9WlMxlqWqC4mUFVLRzVZNuGF7argAmKrJRqLg/BREltYJX3C26qIuO8zNhtali7JczWUU1C20FvT083N5b2kKQ5s91Le4JCBZZH5ne+hkuqjP+MoNUBZiOzXxAQ0rUPKXxDNXSSTnsFPM3vk50pSXJvJJ4t3Dc=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BL3PR12MB6594.namprd12.prod.outlook.com (2603:10b6:208:38d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 23:41:08 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::9bdb:ffe:c29f:432f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::9bdb:ffe:c29f:432f%6]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 23:41:08 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH] usb: dwc3: dwc3-octeon: Verify clock divider
Thread-Topic: [PATCH] usb: dwc3: dwc3-octeon: Verify clock divider
Thread-Index: AQHZydwMr3ys/6Q1+Emj3TT3ZlfDAq/hD9mA
Date:   Tue, 8 Aug 2023 23:41:08 +0000
Message-ID: <20230808234059.bosmyyltsp42mt43@synopsys.com>
References: <ZNIM7tlBNdHFzXZG@lenoch>
In-Reply-To: <ZNIM7tlBNdHFzXZG@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|BL3PR12MB6594:EE_
x-ms-office365-filtering-correlation-id: e759af7d-6f29-4046-0f68-08db9868f08c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b6TDsK4lT6s3IE4b15uYKaULUG7GqoDMqF//6GAQ0l0PXVtcrhDbT5whtUOu4qlrbQZFFlHxWgJaY/43A9NcfGBjjapHbMmTyrJaLeCbhO08oFfv+G2gUZcEz1okkIlOLf6lak64ImR9S0mbCF2RGNW1KLGTFB0f5RemLMEDT73iltC9DkVXT65HkuhACPgno0pD9EwkauuSkg5l7N8zSnK+78bfiEgwIaekQ/T3/mzwqmFKnQZwfIsEkrn4zYUXer814BYfWHPlhEH+l7Vvl2UL5jtdBPS/nfChfXo813Z54U/w9zobvIhHOfUKX2tbChEdRmyZc4gYOq7Ko8Nz9zvEZTi3Pnj5/EzAyUlrj1cWfNPiZbNCCzA6DObTGdDBw9/zJOvRY3OsWcEmFy70bOMaD7gSgqZceXSc5bS6OTn9z0Lj5hPNSqQtoVbC53M83Vp4XCjQZWl0YDITVaxjLwPXTv+rjigvJ276+XlfohZJzmYN9TjffTzMRqqRtalCM/fhNnb4cAf+eKhRrDrLPkkDQNh9cCEJJwn82Y9oWCE2ADtSe1JxTjn+XGcZ0pK7Jc83AMSAypofUf/eeLT0pi7hXa+q2MLaKdeZd1iB6FY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(376002)(346002)(39860400002)(1800799006)(186006)(451199021)(83380400001)(316002)(6916009)(66556008)(66476007)(66446008)(41300700001)(76116006)(64756008)(66946007)(4326008)(38100700002)(5660300002)(6506007)(1076003)(7416002)(8676002)(26005)(71200400001)(6486002)(478600001)(6512007)(8936002)(38070700005)(54906003)(86362001)(2616005)(36756003)(122000001)(2906002)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVBDZ3p4YTI4TjQxWkdOaFV0c3U0T0RldXFOYTRlQk53M3RtUU5DOS9MMHdD?=
 =?utf-8?B?U3lwNGxiWlE4aC91TFFOTUFuZVc1d05KMkNFTkZQemNCYyt2YUsxS2NIRHY0?=
 =?utf-8?B?Z2pZcFlXWXdrNlVTNVdUaktjY1VpRkRxUWZlQjE5YU10OUJaS0pEMHdaWG9J?=
 =?utf-8?B?Y0E0SzVHSWg4K2NsTml3akRJTi9SV2lROEhEaGowcmIvK2dsK3hOZlR6OVFH?=
 =?utf-8?B?Q1VJMUVEMklqdGUzdkRKWlZEWWUwOXBzYVpzeU1xUGozbXpCLzgrd0JtVTI3?=
 =?utf-8?B?Z1JybE1hcUEyK2k5NjRRN2lhWC9VSDh1ZVcydHpHM001aGdvczlrTG4zL0Jl?=
 =?utf-8?B?TWFJU3U4ZjJhRU1GWVZpVlRnTGNldlJlWnQybGUrOFdSQUdOaU1WemtkQVFB?=
 =?utf-8?B?SFJGamJRVnI0eFFHaldvM1ZmblFCdTErUlpyM1R6WVprUldlSUU0THJtNHBz?=
 =?utf-8?B?QUZXbmVmMW11YWZxUjBwbWt5WGVEdWFId2RIVmlkdUl5NXJCaXc3QzdxWk5O?=
 =?utf-8?B?N1FmWDJsRldmeFUxc3BpRXlVOCtsVC8rZ2JzajNndEVoZVdQTXgyUEgrZzVK?=
 =?utf-8?B?elA2MXcvaDFHbkZRRVJFYmdsMDBQaHh0MC9PV01WZXlsdXJqNVRsZDRLRWlh?=
 =?utf-8?B?ZmI5WHB2M0lJYm5NNkdXbVJrb2N2SGJFRVRGUlovY0ROOVVtOVVuKzZQdk0y?=
 =?utf-8?B?SUJ5aXE5TEZpd0lXbG1mOFQ0M3h3WkdoTVZneEovNWcvQU9PcDF3ZlJPalp2?=
 =?utf-8?B?YWZIMXNtWDNkc2owbTNMRjh4a3VRRjB1bGFwVVRlcWV2SklWR0EvZkN1K0xz?=
 =?utf-8?B?NmVrd2hKN3F1N0hrYlN2cVNKdHIrcXd1d3BtWjhWVFI3UGlDM2pyWnpTOHND?=
 =?utf-8?B?blg5TEJIbXlhdUhmSG96YmlCTHBDVUhwWGc1NGlFMmxUejlnYXcvTFdKekRa?=
 =?utf-8?B?YUZGZi9SNFpOalBGazQ5RVV1L0oveWJXU2M4K1pDMWdTb245TWFyTGxKTFpW?=
 =?utf-8?B?T2ZvZVYxZ0U2N0xHdzRHWFdUQURpRjZFdDk2WFRzRTJ4ZHVFVElMbHZnSnRx?=
 =?utf-8?B?eXRiQlVXMGc4S3dVODBwbTlvSWxqVXo5UFFTbG1TYUd0YlVITDVtL1lYUUNK?=
 =?utf-8?B?WVorZjNCQ1dSQ3Y3c1hYRzhHcHNjM2YvcXhhcnBZRGNSMmZzTmRibHpmTStr?=
 =?utf-8?B?VGI5dUF3dmNIWjBHUFVWU2FDZkM4cFQzTkZtY041VUJMTTkrRHhQMTZuU1VH?=
 =?utf-8?B?KzFaRjFTaW1LUHRGdUlHLzZSZmN0SSs4T29HNUl5YUZjMjF2dm50LzF5NTVv?=
 =?utf-8?B?anBCS3FjSGxxVVpuMHBpMXJpY2c1WWtWcFpCaFRIZmMzSUlHTXZwOVdFN0tO?=
 =?utf-8?B?eXhMVFkxNEJablowNCsxeVJlS3RaeXRBRnFlb1hPZDNweU1LZ3V6ZWt3Z3pX?=
 =?utf-8?B?WkU1TkdvbXpoT0ZVVFlYYUZRU0cxcnV2b216UXYxRUtYcFNDSHIwc2lDOUd4?=
 =?utf-8?B?TDBhU2ZodHVFQVBFT3U0dWhtVDFrbWNsTG83L2xPaFNNeDJGbzc0cnR6V3dM?=
 =?utf-8?B?bVY4dElldXZ6akErOStSQkVOTXVQaDE1UjFVWm94N0hoOXZXamo2bmlKNzZw?=
 =?utf-8?B?QU1uOWJFem9LUy85ZXErOVkwVEl2eG9ESVFRWnhmcGd4VTEzV1lXN3JLV2hn?=
 =?utf-8?B?NTh6THJxdDIxVUc0dXVTdnFjcEI3b2JZc0MxdDllOWJmY2U3Sm5vZjI4M2ZP?=
 =?utf-8?B?bWhqeDhuU1V4UkRyUkZmQXZyQzQxRTd0NzVKTkhKQTVEL0JlWll4WUdmY2h1?=
 =?utf-8?B?Rko1eklVekZjUlJKWERQUkYzVzkzWmVnaU15N2ZjUFF0NzZZY0FXSG83VHVi?=
 =?utf-8?B?UkdnNEVmT2RuRnNtam9NY1NybEZEWlBEd3h4UVdNelo3dTUwQTRtVmRZTnh5?=
 =?utf-8?B?RnZDWHdGSjcrRUx1bFltRXJqSmFEK1pUQU96MEtXZTlQbnRRSmhBc21lTDNU?=
 =?utf-8?B?dS9YMS8zVTVnMW5yWmxlYUdjU3lNOWI5Q2ZjRTlZWm14b1l2cUUxQWpONEVS?=
 =?utf-8?B?M25wRmU0VlNkcjB4Mm9iWXR5M2hTZUpJMVQvZmgyYUdhOWlCdHlMVktFVmZ4?=
 =?utf-8?Q?T/4spoNtMseO1slebQp4FURo/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34913ED040E7ED4F8658A20D4611E51E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?R2l0MzNzU28wMm1PNU52YUgwbU9rTUVENTR2N2F1cVViU3BDS1E3UlB0STgz?=
 =?utf-8?B?blYvZGdEcU9LbmJicmZkMWxzb2ppd2JkYUpMWjQzOXRxeUVnampBRDc1VzVM?=
 =?utf-8?B?SkkrQ1FoYUp2NGtKcWhsZVRncHBuYTZjVEJpdi9tUWgveDJhKzZuS0htcmZr?=
 =?utf-8?B?RDdralE1VWo4K0syWm9yM1dpOE9TRnNON3VOdlQ2Y1pjU0xBNTBobzdKTUdG?=
 =?utf-8?B?T09OK1VuY0lTWklCT2NyQWVjUlJWQTJ2d1BYK2UrZWtGNEtXeUV0bHZKV0xh?=
 =?utf-8?B?c3h3djV0a3Fadk8xNmd5SURMQUF1cU5sQVBxdXlaSHVwYUlXL21JSlpzMldN?=
 =?utf-8?B?K091Sk5jSEEvUXpXb3BQZ2x5dTBTczhBQ0JlM0FSMVRXdytXcUV6cFNoM1BG?=
 =?utf-8?B?bkJoLzZuSXlCSVgyZklwVE1YVU5SNGJrWFFaWXVJdUV1Zk44bjFyODJlYkZp?=
 =?utf-8?B?RktMWXJkaFdqZVB6Q3JzWWNVbmtVaDByNllYMk1zNmlYZVVITUNOL0N3c2wr?=
 =?utf-8?B?SWY2L2lmb3UwZDUycFQ5NlB2VGgyWXFkL01LWEJMdVJzYUp1c0xmbytWY2pa?=
 =?utf-8?B?TXBEc09ESE15c1VSVjJDRUVyQm5qazdhR1Z1R215cHJmd1pMbmpJcHE1UU8x?=
 =?utf-8?B?eVk2aVdncHdiaFJaYnRRa1lGWFIwTFpZNnlGL0YzUmdKaVozNlRPL2hyNk1l?=
 =?utf-8?B?d25oeHd2RERxVThjMk42S2dqUDZPSG1oZ2NyVnpOVzZsV0pwbk5DTTJONmht?=
 =?utf-8?B?eWJqUG53YzN0TGs2cHdMTEQ0VHRuRW5pazYvUVdvQ3VPWFA4M2lnSGZNeEhO?=
 =?utf-8?B?OW8wTjllZWcwYXRtQmFEZG9CZUplMGlSL3lob3BObDdEREkyUVpQL0JMcGZO?=
 =?utf-8?B?am9aSThwdTluQ1cwZENjNUZFOFBGeE9UaDcxVXlDUFN6RXFJODdsY1ZnWkdG?=
 =?utf-8?B?N3E3V2JEMWw4RG43eDYzL3NXTkxSQXo1SzVNMFJmeXR0K0lMYzVhOVYwYVN3?=
 =?utf-8?B?KzdXSHd0WVo5Nzk3N25hL081TDI0QnJHUXF5eWtrRnBmakUxRVpxTS8xd24r?=
 =?utf-8?B?NExtRUxsUVh2WDdWVFR0YUdNSzBnWis3L1ViVXJ1Zjd2L1UxWXBLOHZNbzdR?=
 =?utf-8?B?VmlBd2d1aVAySlhYU0RHWXhWNHpPVkVtMUsrTGgvaTNKWktHZU5xc1JNS2lr?=
 =?utf-8?B?ZWcvV1FKMWNOVkdJMm5rNHM4RTFneHhBdzdOWHMyMU1KRVZ6SHZjTisxN0p5?=
 =?utf-8?B?VEloVStWRjljbEFENjdjc2Q2N3k1VDB2Y2pOZUQ1WmZxZkpjYTI5Ti92cWw3?=
 =?utf-8?B?N2orSU9NNm9IRUpveHVURlYvU1BKZ2ZKdm9xMmhPWFVtV1MxMDIrNHQ3dVBo?=
 =?utf-8?B?MGUwSC9mSWtwTFE9PQ==?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e759af7d-6f29-4046-0f68-08db9868f08c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 23:41:08.2618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PvInheUnYvxZvdWaFa6Q8NizeLVjvpwQJl8sygDuh94MO6TwtfU759X6cfU2qhEomzZEPmbPB3UeXzBNhjxaHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6594
X-Proofpoint-ORIG-GUID: 7XzS9jnkH0S1259NEEJSJgQiMyhfYCoR
X-Proofpoint-GUID: 7XzS9jnkH0S1259NEEJSJgQiMyhfYCoR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-08_21,2023-08-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011 mlxscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=806 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308080210
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gVHVlLCBBdWcgMDgsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBGcm9tOiBMYWRp
c2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IA0KPiBBbHRob3VnaCB2YWxpZCBV
U0IgY2xvY2sgZGl2aWRlciB3aWxsIGJlIGNhbGN1bGF0ZWQgZm9yIGFsbCB2YWxpZA0KPiBPY3Rl
b24gY29yZSBmcmVxdWVuY2llcywgbWFrZSBjb2RlIGZvcm1hbGx5IGNvcnJlY3QgbGltaXRpbmcN
Cj4gZGl2aWRlciBub3QgdG8gYmUgZ3JlYXRlciB0aGF0IDcgc28gaXQgZml0cyBpbnRvIEhfQ0xL
RElWX1NFTA0KPiBmaWVsZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IExhZGlzbGF2IE1pY2hsIDxs
YWRpc0BsaW51eC1taXBzLm9yZz4NCj4gUmVwb3J0ZWQtYnk6IExpbnV4IEtlcm5lbCBGdW5jdGlv
bmFsIFRlc3RpbmcgPGxrZnRAbGluYXJvLm9yZz4NCj4gQ2xvc2VzOiBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9xYS1yZXBvcnRzLmxpbmFyby5vcmcvbGtmdC9saW51eC1uZXh0
LW1hc3Rlci9idWlsZC9uZXh0LTIwMjMwODA4L3Rlc3RydW4vMTg4ODI4NzYvc3VpdGUvYnVpbGQv
dGVzdC9nY2MtOC1jYXZpdW1fb2N0ZW9uX2RlZmNvbmZpZy9sb2dfXzshIUE0RjJSOUdfcGchYU1I
TEpFRV9hTEVSSzQ4T0pZMm1jZnZobTZPWk1lQUI4SVVaVWMxNm1lX2pGdXktVlZzZ0lYbi1jUDVL
OTlzUGVfZUVaVG9HV0lCWFFKQjFDeFpGVmdNY0pBJCANCj4gLS0tDQo+ICBHcmVnLCBpZiB5b3Ug
d2FudCB0byByZXNlbnQgd2hvbGUgc2VyaWUsIGp1c3QgZHJvcCBtZSBhIG5vdGUuDQo+ICBPdGhl
cndpc2UsIHRoaXMgcGF0Y2ggaXMgbWVhbnQgdG8gYmUgYXBwbGllZCBvbiB0byBvZiBpdC4NCj4g
IFRoYW5rIHlvdS4NCj4gDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMgfCA4ICsr
KysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYyBiL2Ry
aXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYw0KPiBpbmRleCA2ZjQ3MjYyYTExN2EuLjczYmRj
ZWJmNDY1YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9jdGVvbi5jDQo+
ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYw0KPiBAQCAtMjUxLDExICsyNTEs
MTEgQEAgc3RhdGljIGludCBkd2MzX29jdGVvbl9nZXRfZGl2aWRlcih2b2lkKQ0KPiAgCXdoaWxl
IChkaXYgPCBBUlJBWV9TSVpFKGNsa19kaXYpKSB7DQo+ICAJCXVpbnQ2NF90IHJhdGUgPSBvY3Rl
b25fZ2V0X2lvX2Nsb2NrX3JhdGUoKSAvIGNsa19kaXZbZGl2XTsNCj4gIAkJaWYgKHJhdGUgPD0g
MzAwMDAwMDAwICYmIHJhdGUgPj0gMTUwMDAwMDAwKQ0KPiAtCQkJYnJlYWs7DQo+ICsJCQlyZXR1
cm4gZGl2Ow0KPiAgCQlkaXYrKzsNCj4gIAl9DQo+ICANCj4gLQlyZXR1cm4gZGl2Ow0KPiArCXJl
dHVybiAtRUlOVkFMOw0KPiAgfQ0KPiAgDQo+ICBzdGF0aWMgaW50IGR3YzNfb2N0ZW9uX3NldHVw
KHN0cnVjdCBkd2MzX29jdGVvbiAqb2N0ZW9uLA0KPiBAQCAtMjg5LDYgKzI4OSwxMCBAQCBzdGF0
aWMgaW50IGR3YzNfb2N0ZW9uX3NldHVwKHN0cnVjdCBkd2MzX29jdGVvbiAqb2N0ZW9uLA0KPiAg
DQo+ICAJLyogU3RlcCA0YjogU2VsZWN0IGNvbnRyb2xsZXIgY2xvY2sgZnJlcXVlbmN5LiAqLw0K
PiAgCWRpdiA9IGR3YzNfb2N0ZW9uX2dldF9kaXZpZGVyKCk7DQo+ICsJaWYgKGRpdiA8IDApIHsN
Cj4gKwkJZGV2X2VycihkZXYsICJjbG9jayBkaXZpZGVyIGludmFsaWRcbiIpOw0KPiArCQlyZXR1
cm4gZGl2Ow0KPiArCX0NCj4gIAl2YWwgPSBkd2MzX29jdGVvbl9yZWFkcSh1Y3RsX2N0bF9yZWcp
Ow0KPiAgCXZhbCAmPSB+VVNCRFJEX1VDVExfQ1RMX0hfQ0xLRElWX1NFTDsNCj4gIAl2YWwgfD0g
RklFTERfUFJFUChVU0JEUkRfVUNUTF9DVExfSF9DTEtESVZfU0VMLCBkaXYpOw0KPiAtLSANCj4g
Mi4zOS4yDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3Bz
eXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==

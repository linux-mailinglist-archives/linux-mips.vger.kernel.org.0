Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D61AA76C19C
	for <lists+linux-mips@lfdr.de>; Wed,  2 Aug 2023 02:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbjHBAsA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Aug 2023 20:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjHBAr7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Aug 2023 20:47:59 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3266199E;
        Tue,  1 Aug 2023 17:47:57 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 371NsUoO024097;
        Tue, 1 Aug 2023 17:47:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=EEIWx2KYg16EVdhPmhfR/TXhCYDuCNGMrKFqNlIxtIg=;
 b=AI9qI7uZi1PrHPhyEpYG9nLR2EnnkxnzSxluFleY0UxD3FJvU0xEDA7bOrw3CB/Mh+zB
 C0Y5r+WSh9/9OvJy+DQVXvKEtXxwbFthsX7PSlTgwhkdjNOcd1IJKRLte4u8yHe3QJJA
 cih2VqUz5r1jxLbq5amnO/V0irvUGOvuo2wukMlR/EH4fnp9j7zpNmkxXkYDmLoxSmyn
 xWaq6Cjj9TxBM9InkbOADtBEmJoNtLed/AJhAisTiBI4cvE2RC/X9/VhT2ZNwar2qcrM
 jDwHDlymAXhWFZE3W7FLKTCXntBqccdi8nlI7SUzxMIOfZpbGwOvuK+5+oeakyLfcSD2 Yg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3s51psyrsn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 01 Aug 2023 17:47:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1690937254; bh=EEIWx2KYg16EVdhPmhfR/TXhCYDuCNGMrKFqNlIxtIg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=TL6PaV3h/MYJ6Ru1KFjftiii1HZPWrEY5uElbYj4FD4PkMxuYypXNY5LPB8HWUgo7
         JW1FqFv3m4luvF6dGyRnXtdnH7rZPKYzs96jV2TqQhtDYhhwOy5e7IP6HFPHmEsDfq
         cheHXGb8vBwGUMwvcv3quqO63So/RjUwWXvcEjilXZdoNDkWKnXJVpne1y+lWga3uE
         Cmi3M4YTkcMre7WitQpqgzk5LWpf2tgcI9OkJuGjEkcYBaNqKdcaU4AeIgwu1FsRjD
         IPIGXnDUPF5D/bnWMtUW6s+LNHGt/44B7p4BHEuqmgHo+uMrVfF+VA4EWh5LWDCOEK
         Xy2Ph1Ehx5SsA==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6DBDF40145;
        Wed,  2 Aug 2023 00:47:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 9B3B5A0079;
        Wed,  2 Aug 2023 00:47:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=qcu6e9QT;
        dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0062740136;
        Wed,  2 Aug 2023 00:47:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+piTJHQt829eIV81jR5lvBCN/3pi8Jwq7D0bvGChjvkbNr1LuJe03hNJujF0oc7irABfofjCFENXz4xd2cgxdYBup4lr1oezLKpVDBageATj6q6J2HR8Vj9AXwMNjuXRX5Zx8QRVOqGroDw/H6YvgzIEnId78m9YhrzuvkYAtH+bYZ9/5EOsmwDCwxenSyH/yf0vDwlJRCw5qePf+mwpU2IzUn4dKGbZHAy21gnxneq2XGYdkTYuBPK+fAnjsZjQb7OGwXx9vLZ0swllCn4OCdYajnNFBuC5b/Bak/Q7+gejjSsIYDuzk0T5erGXCggm/+ofmzeh26AnLHIgf+68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEIWx2KYg16EVdhPmhfR/TXhCYDuCNGMrKFqNlIxtIg=;
 b=PB4SVBHtqrbB/+Mf0N3NtqUPmrveMqhuQVCjVkoRWQ6FfSGejWfjwd45TZ33kFIQC2VEwyPNsL/CwmXs+w6fFmnOnyzSUuSXJDIgb9XIdAE2OtTdLF7h2u93w0quot0FHx0N/oHFmYrpdYVanRRD4EHUgSwA9NemSyoNMsJIyB/eP88+UdhaStqigsPdjWTI65xQ/Iv/OHixdu3LMQucFhqDxFfymucj0WcHc+/WlX2OMh1m8ndol46uvBzRlZuU3iLA6blyK1rHyTI8KUIwKLvEEu+otKkkjl4k5i0tuqeung6yjKqtdZGCYU7JIkxueBHuNsVI/tCMsWH7vQhnGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEIWx2KYg16EVdhPmhfR/TXhCYDuCNGMrKFqNlIxtIg=;
 b=qcu6e9QTaOOYmeq9yvC+SdYSBKnkGACO2m3l3A85xSs66XjQ0syeJcoznsJHL/ly3BY4WRUvEnkIFO+g+zZJCskpug6fwQHK401WV8B2xAGgcHJmPLGB6+F7K6PDEdc07w64O7mgRWFlTFuAiWTDMgOitccx9cs1wRsV4sCgAXo=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MW4PR12MB7311.namprd12.prod.outlook.com (2603:10b6:303:227::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Wed, 2 Aug
 2023 00:47:25 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::588e:6476:a6eb:d698]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::588e:6476:a6eb:d698%4]) with mapi id 15.20.6631.043; Wed, 2 Aug 2023
 00:47:25 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5 4/7] usb: dwc3: dwc3-octeon: Avoid half-initialized
 controller state
Thread-Topic: [PATCH v5 4/7] usb: dwc3: dwc3-octeon: Avoid half-initialized
 controller state
Thread-Index: AQHZw5Hq0x+4HFony0iQUSJ7/Fn126/UmeIAgABTiYCAADO4AIABDYQA
Date:   Wed, 2 Aug 2023 00:47:25 +0000
Message-ID: <20230802004722.gtttii66ky57kfww@synopsys.com>
References: <ZMd/HzISn0mPsNWt@lenoch> <ZMd/oMRx8ze22/kK@lenoch>
 <20230801003838.ifbydrbwq34df3n3@synopsys.com> <ZMiaIUy6d5gVl7mA@lenoch>
 <ZMjFhMrnrJRQ2Qlf@lenoch>
In-Reply-To: <ZMjFhMrnrJRQ2Qlf@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MW4PR12MB7311:EE_
x-ms-office365-filtering-correlation-id: abf66b6e-3e22-42d1-3c83-08db92f20a04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hy1UvPNqo9eLJjtR2xlMczwRlV8/u70RtbdWvejkH9yVMeMRllPwKZG3Y3tQk0UDqpxoeu1YSzUUO7eVpc+K9IjeigL+ZqvFamggadI91m2oWsctq66aFz7INvfWmkRhmDvqF03gzRcRG7a+2KdbIXNwMuoR2wSxyutCqxdCwAymQrId2RYTrKpfJ9hMjVOTADW+u3+4eeDbTveQYmYVo8cF5ZDMLTslXLAq8vQbsx3WCDVbcYJzxRA0bJFCDuyEHYiuB0KLDiU7J2sK1BLUJgDRnYh2xCaLED5MKow5GXNJ0S/ijdoTtHHhRP8kZOsvLuXhqftwNqHdgzC4I8hJ+5QEjZLWx35SAWJsS36CP0unyhbnccTak66xl1Y8Og1tH2L8KBoig6B+1UmwP9xitNLhc2ofKzfmrAZIdfhDpvRXS6OCFiHOw3UfykeuLWTptsJgixeSK3ZddH1BFO9Ix1wYOs4x9PocKUJCVTBMlwGQz9XzPzWWxlBq/tUzxHftpCsthgrYOZ27snJ4AI7+CRQAeiu24Otpu0OgFt3CvE85twn78Lm1ioG0YP8fn2ZrdJrbF90b1eQxBhoxckilQokOUa31pMVGcojq3bbjpaN/aj/WmI4sKoANv+vPHzo5OkJ8GX0nYvI2uv2DF+VIw8QDE+t7DXpPAfLCGVreTY8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199021)(26005)(6506007)(1076003)(186003)(6486002)(6512007)(71200400001)(5660300002)(86362001)(8676002)(8936002)(2906002)(38100700002)(66476007)(66946007)(122000001)(76116006)(64756008)(66446008)(4326008)(6916009)(316002)(38070700005)(41300700001)(66556008)(478600001)(2616005)(54906003)(36756003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2dGT1BZSzBydHpNRks3ODNVQUpDaTBkb0RiUXhWRkF5SlZPVG9hWlMzUkF3?=
 =?utf-8?B?ZGJNUjhIM01VM3FFQlZ2U05nS2wzVlYyR0lZWndmdzd1dW16VkNyZlF4eTg2?=
 =?utf-8?B?ZldiODZ5Z0VwY0JRSXJLbzVVdFBocHErdllZQVJHbTUzZjBCUXI1NGNMemkz?=
 =?utf-8?B?TUpEWXp5bUs4QmtQWERRS1k4b3Q5emF2QTQ2a2tYQ0tFMVVkT3c4aGQxM1ZB?=
 =?utf-8?B?ZXlINElzWThwcVNjTkJ2T3hhWDQ0M3FNN3BmTlBFaUNsZVgvckVsYlF4ZEFw?=
 =?utf-8?B?UXdFRkhUemlWRGkxUUpYanB2dVowNXBaWXJUTGNDZGJVNGVGeFNvU1JDTktl?=
 =?utf-8?B?YXdUenFZMnl5OFRZZkxab29XMGRLL2JubmxRZnpIdW1sUWNKNys3RUx2V0Vv?=
 =?utf-8?B?SDRtMEQ2L0RRbDZqSjlDYXNQN2VITG1LQlQrRDY3cUxsdDN3WnN0TmxPaUpG?=
 =?utf-8?B?TXpleVAydGlnQjdKZzJhUTJIOFY0ZHFIbWR0V21PaGdId2JWTHdXemRlY0h4?=
 =?utf-8?B?VzRsMzNBRW5mcUF2dTJVNnZzNlg4NGJFcloyNXdEU0tUblc4a1gyT096em5G?=
 =?utf-8?B?cVBPVW1VTzZNOXM3MW9oMGx4MnFuY3pYQzdGbUdJNVVrYk9ldFhpSk1TbXdV?=
 =?utf-8?B?QXdtR1VCemVla0d6M0REOWNtNEx2eFNNZ2Y1QlpDSmRKS2lmdDkweUkxNGdW?=
 =?utf-8?B?QTVLenc0STZrU3BjTCt6UjJRaVhWS09KNk5BWGdDR3B0RmZMYlhISTcxU29v?=
 =?utf-8?B?bnhUeWYxZEp1SjFRS0dGVTNPbHgwMHFFdW03UVkrekNGSkJYbDM5UW53NTho?=
 =?utf-8?B?cUhFLzlkRlN0RnNOd3dlaG1aVGFmU2tISGtnMFppVktsYmFTeDU4djhhb2hi?=
 =?utf-8?B?VUtuYVVVMmRuUGFsL1F4N1dPRlNjY2pZMFRmMXJ3Y3BjZmFiSmVCQTI4MkRB?=
 =?utf-8?B?NWQzQ2dpdEw0Znd1d3dWNUZPL1ljcXd0MlNWM0didFpmd2g5Y1Z0WUZQMEdU?=
 =?utf-8?B?emloRG11OWwrRWtzbzRaUzR2aHB1alQ2S2dBb3BjWFB0elBnZUZ0ZnBZVzZH?=
 =?utf-8?B?SkpjRnE0b2Z3TkZBSmgzRTg4S3B2Ymd3Umt2ZG80MDBEMzVnN0dEUFVIWDJN?=
 =?utf-8?B?NDZBUnNZN2RyRzU4bXFnV3FwRHdGdUpRZ3doZGN6ektWUlZJV1RKTkQxVmFT?=
 =?utf-8?B?VGlRdHVnenFxaVJzYlR5aFhGbEVsNkVIU21OMEJTVk1xUFY5L2l0WXRtRmRJ?=
 =?utf-8?B?cVpYVzR2NHR6Q0tQMWdvZGpWM1JkREl6M0tmM2RTc0ZocmZlSUhUVTUyeUh6?=
 =?utf-8?B?VEgwRjdJQWtSTlVPanJTQnAybURGY3RrZ2w1bWUrZnZidkhSV0U1UXJmcWFO?=
 =?utf-8?B?TDFxdERSbGloU0pUekVVZk1xZ3ZKZW9Bb3RtNE5NbGs0RVhhc0dvYlJmMWdu?=
 =?utf-8?B?Qng4M0F0S2JjRWR4ZlpoYUM3WTJhMm93bmJLVTVzMXZnYmlYRlExRjcxZjNl?=
 =?utf-8?B?VzQ1ZHAwT0E3ZCtYRk54aHY3cVFKNjBTQlh0L1c5cXZNUFM5WmRLaGoxMGVS?=
 =?utf-8?B?RStXNS9YSEFVOW5sMmNPVFUyUXRPUHJtcmJXa1FWRngvNVM0VXk2YXdKbFdz?=
 =?utf-8?B?Vk9qUEFHOGl1a3pQWWk3Q2hNT0g4cCt2ZGlzMk8vSENTSzdINk9MQlhic0hk?=
 =?utf-8?B?V1l5bFhzTGZtSFNOOGdEZ3p6R253Y2U4Mlg0TDBheXFXWUlOL2NyU2xjWWxy?=
 =?utf-8?B?eVV5akNKWEdhTFhTeGFsV1JVZXhSZ3hlVFhoT1BqS3BLOGR1YVZJZmVsUith?=
 =?utf-8?B?Z1NCMDFzaHZLd1lHckY4eHI3TVFXVmJ5L1ErckI3Z3J3blY4R0tOZTlGNTlW?=
 =?utf-8?B?a2QzLzNLUmtpWWRweklzbGFoWXM1VldqeS9wUDRmRktkLytPZVU3Z3NTVFR1?=
 =?utf-8?B?cWV6Zml0V1RyWmlseE9FOTJ0MExpV0tlVExhNlJBVER4dFRZekNYYktPcENJ?=
 =?utf-8?B?MDNuSzNSdk1HenBkYzVBQk5HeWlpR0Y4LzZhZUZuUXJSWW95ZW0wdHFvUmdD?=
 =?utf-8?B?WGFzS3dwRUIvQlNYSmw3Risrb1FjTktqSHBLUXoybGpheTBGS1hSRmZHVHo1?=
 =?utf-8?Q?s790fNxwKBibhpiKaj771RpGU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <080527956FBC3F4CADB3F2F27072E664@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?Qkx4RzVDbEhKZXBwcms1ZmtGYUJkNnJvN0Y3eTRPTnE5OWhIM0phcXhJS1Ba?=
 =?utf-8?B?R2Y4aDI0NUsvdDFRMW9jNDZqWkZrakhiaUVWTkJtL2xRYnpHdEM5OUtUQXBw?=
 =?utf-8?B?bUNwSFdERmF4WUpFeFh2cUtxU0ZxN0tjd0psM09LV0pVTXluUEx4cC8vVkZD?=
 =?utf-8?B?WnE5c1pqRjNzdHZDMHZHQm84VkFBV0x5STZWTHdMRkJPTDYvYVdHNnJkd3NY?=
 =?utf-8?B?YjhrS3ZjM3JKSlFCZmxxbEFmeFkydHBScnhPb0Y5d0xJdFJYTGFnNjVGMU43?=
 =?utf-8?B?cmZSR3hZTmZ0SG1wZlVCNDF1cnh2NmJQaDlTMXh3VjA1RERnWWpaeG4wR3Nu?=
 =?utf-8?B?RStrSGJCamxleENUNTlxSzBJamlIcmRNQXhsWlpYSUdxZHlYNWM2a0xSNHMw?=
 =?utf-8?B?UlZBUWcvZ1hiL1R5czQ0UjFtWC9hRWNuZnFVY0xUR2x0QmFFa2tCRTJ2OU9p?=
 =?utf-8?B?VUcwV2tVbjNta201cDlpU09qK2YyMCsxTWp2RFE4OWQ5TEJ4NFF5em1MYTZl?=
 =?utf-8?B?VW9PZkttTjhIbXJqSWp1eDRPTXNxQWtoaXhKbW5DOEpTWGRQRkY5aU82L1N1?=
 =?utf-8?B?c1hSclhWUlhJcjB4OUZtT3FCb1FmbW9sTXJrSnlVU0NlYkUzaVdlS0xjcnlk?=
 =?utf-8?B?M2pJN3NZS2UyczVkUUMxSnE5SXNYZ0RrV29VU1l5QlVZai91c1dGZnBsRUdQ?=
 =?utf-8?B?WFl3RzVWUTh2UHZTVlJQUGt2L2dWWS9lZzhRQU55YVNTQjJ0a1pwTVhadnJS?=
 =?utf-8?B?N09LS3c4T2g3K29Yb2lGcjUzczNlczZ4RzMvYTFralpZZ3ZzUTV6dHBQRW9i?=
 =?utf-8?B?K2hidWYrZmdHd09zZXB4WlBkK2FFTytsb3RBZTREbHVUUE9kam1pVmFoOFl0?=
 =?utf-8?B?M3pBdG5zVXR0TGZNZTlCVFo2QkRSc0JuL3p2VGdmemllbHJSNzcwejRybWwz?=
 =?utf-8?B?eXdKZFpDRThxVUhwdWx3bFZMWitJeTA5V1lWQ1BmN3FxZFNMUXlIZW13eHNL?=
 =?utf-8?B?c2p1YXRqY2U1SDMyOXkyS2VMOVkxQzdlQ09jSjFvVlNpeVZzNTFZL0pEdVlk?=
 =?utf-8?B?aXVBZGlDWnkvYjVlK0JVQ0hrcUdwQVJhRFlFNTdpQXorTXUwK1NxTWp6QUdu?=
 =?utf-8?B?QUlzL0dRTElUNEQ4ODJJK3lKOTl3VXJHQVVrNE5xeUNRZ2VRbHRMZVpLcmZi?=
 =?utf-8?B?VStNblJFRnBISXJaa1JVWTNtNkFvaHZnU0FlZ2s1UmtjSmowZUExY1JZQ3or?=
 =?utf-8?Q?lPEnxaBhwCNJQwZ?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abf66b6e-3e22-42d1-3c83-08db92f20a04
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 00:47:25.0267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ut61fKn+5qqG8bLt7iCMhN2eFl0XmEgrn+moyduKc/Ckzly0QvBLBJcyAolPFZ7I74tmyWGNbqjQ1wjrXOqptw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7311
X-Proofpoint-ORIG-GUID: lxCoqt13rRSHgW-oCE9T-0jPPUPVG_Hw
X-Proofpoint-GUID: lxCoqt13rRSHgW-oCE9T-0jPPUPVG_Hw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_21,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=697 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308020004
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gVHVlLCBBdWcgMDEsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBPbiBUdWUsIEF1
ZyAwMSwgMjAyMyBhdCAwNzozNzozN0FNICswMjAwLCBMYWRpc2xhdiBNaWNobCB3cm90ZToNCj4g
PiBBbnl3YXksIHdoYXQgYWJvdXQganVzdCBwYXNzaW5nIG9jdGVvbiBpbnRvIGR3YzNfb2N0ZW9u
X2NvbmZpZ19ncGlvDQo+ID4gYW5kIHVzZSBhbGwgdGhhdCBkaXJ0eSBtYWdpYyBpbnNpZGUuIFdv
dWxkIHRoYXQgd29yayB3b3JrIGZvciB5b3U/DQo+IA0KPiBTb21ldGhpbmcgbGlrZSB0aGlzOg0K
PiANCj4gW1BBVENIXSB1c2I6IGR3YzM6IGR3YzMtb2N0ZW9uOiBDb25zb2xpZGF0ZSBwaW5tdXgg
Y29uZmlndXJhdGlvbg0KPiANCj4gQXMgdGhlcmUgaXMgbm8gcGluY3RybCBkcml2ZXIgZm9yIE9j
dGVvbiwgcGlubXV4IGNvbmZpZ3VyYXRpb24gaXMgZG9uZQ0KPiBpbiBkd2MzX29jdGVvbl9jb25m
aWdfZ3BpbyBmdW5jdGlvbi4gSXQgaGFzIGJlZW4gYWx3YXlzIGRvbmUgdGhlIHRyaWNreQ0KPiB3
YXk6IHRoZXJlIGFyZSB0d28gVUNUTHM7IGZpcnN0IGF0IDB4MTE4MDA2ODAwMDAwMCBhbmQgc2Vj
b25kIGF0DQo+IDB4MTE4MDA2OTAwMDAwMCwgc28gYWRkcmVzcyBiYXNlZCB0ZXN0IGlzIHVzZWQg
dG8gZ2V0IGluZGV4IHRvIGNvbmZpZ3VyZQ0KPiBwaW4gbXV4aW5nLCBiZWNhdXNlIERUIGRvZXMg
bm90IHByb3ZpZGUgdGhhdCBpbmZvcm1hdGlvbi4NCj4gDQo+IFRvIG1ha2UgcGlubXV4IGNvbmZp
Z3VyYXRpb24gYSBsaXR0bGUgbGVzcyBoYWNraXNoIHVudGlsIHByb3BlciBzb2x1dGlvbg0KPiBp
cyBkZXZlbG9wZWQsIG1vdmUgYWxsIGl0cyBsb2dpYyBpbnRvIGR3YzNfb2N0ZW9uX2NvbmZpZ19n
cGlvIGZ1bmN0aW9uLg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYyB8
IDcgKysrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMg
Yi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMNCj4gaW5kZXggOTBlMWFlNjY3NjlmLi5m
MzVkY2E4OTlkNmUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24u
Yw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMNCj4gQEAgLTIwNiw5ICsy
MDYsMTAgQEAgc3RhdGljIGlubGluZSB2b2lkIGR3YzNfb2N0ZW9uX3dyaXRlcSh2b2lkIF9faW9t
ZW0gKmJhc2UsIHVpbnQ2NF90IHZhbCkNCj4gIAljdm14X3dyaXRlcV9jc3IoYmFzZSwgdmFsKTsN
Cj4gIH0NCj4gIA0KPiAtc3RhdGljIHZvaWQgZHdjM19vY3Rlb25fY29uZmlnX2dwaW8oaW50IGlu
ZGV4LCBpbnQgZ3BpbykNCj4gK3N0YXRpYyB2b2lkIGR3YzNfb2N0ZW9uX2NvbmZpZ19ncGlvKHN0
cnVjdCBkd2MzX29jdGVvbiAqb2N0ZW9uLCBpbnQgZ3BpbykNCj4gIHsNCj4gIAl1bmlvbiBjdm14
X2dwaW9fYml0X2NmZ3ggZ3Bpb19iaXQ7DQo+ICsJaW50IGluZGV4ID0gKChfX2ZvcmNlIHVpbnRw
dHJfdClvY3Rlb24tPmJhc2UgPj4gMjQpICYgMTsNCj4gIA0KPiAgCWlmICgoT0NURU9OX0lTX01P
REVMKE9DVEVPTl9DTjczWFgpIHx8DQo+ICAJICAgIE9DVEVPTl9JU19NT0RFTChPQ1RFT05fQ05G
NzVYWCkpDQo+IEBAIC0yMzcsNyArMjM4LDcgQEAgc3RhdGljIGlubGluZSB1aW50NjRfdCBkd2Mz
X29jdGVvbl9yZWFkcSh2b2lkIF9faW9tZW0gKmFkZHIpDQo+ICANCj4gIHN0YXRpYyBpbmxpbmUg
dm9pZCBkd2MzX29jdGVvbl93cml0ZXEodm9pZCBfX2lvbWVtICpiYXNlLCB1aW50NjRfdCB2YWwp
IHsgfQ0KPiAgDQo+IC1zdGF0aWMgaW5saW5lIHZvaWQgZHdjM19vY3Rlb25fY29uZmlnX2dwaW8o
aW50IGluZGV4LCBpbnQgZ3BpbykgeyB9DQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgZHdjM19vY3Rl
b25fY29uZmlnX2dwaW8oc3RydWN0IGR3YzNfb2N0ZW9uICpvY3Rlb24sIGludCBncGlvKSB7IH0N
Cj4gIA0KPiAgc3RhdGljIHVpbnQ2NF90IG9jdGVvbl9nZXRfaW9fY2xvY2tfcmF0ZSh2b2lkKQ0K
PiAgew0KPiBAQCAtNDIyLDcgKzQyMyw3IEBAIHN0YXRpYyBpbnQgZHdjM19vY3Rlb25fc2V0dXAo
c3RydWN0IGR3YzNfb2N0ZW9uICpvY3Rlb24sDQo+ICAJCXZhbCAmPSB+VVNCRFJEX1VDVExfSE9T
VF9QUENfRU47DQo+ICAJfSBlbHNlIHsNCj4gIAkJdmFsIHw9IFVTQkRSRF9VQ1RMX0hPU1RfUFBD
X0VOOw0KPiAtCQlkd2MzX29jdGVvbl9jb25maWdfZ3BpbygoKHU2NClvY3Rlb24tPmJhc2UgPj4g
MjQpICYgMSwgcG93ZXJfZ3Bpbyk7DQo+ICsJCWR3YzNfb2N0ZW9uX2NvbmZpZ19ncGlvKG9jdGVv
biwgcG93ZXJfZ3Bpbyk7DQo+ICAJCWRldl9kYmcoZGV2LCAicG93ZXIgY29udHJvbCBpcyB1c2lu
ZyBncGlvJWRcbiIsIHBvd2VyX2dwaW8pOw0KPiAgCX0NCj4gIAlpZiAocG93ZXJfYWN0aXZlX2xv
dykNCj4gLS0gDQo+IDIuMzkuMg0KPiANCg0KTm8sIGl0IGRvZXNuJ3QgbWFrZSBpdCBhbnkgYmV0
dGVyLiBMZXQncyByZXZpc2l0IHRoaXMgbGF0ZXIuDQoNClRoYW5rcywNClRoaW5o

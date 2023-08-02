Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33AE676C198
	for <lists+linux-mips@lfdr.de>; Wed,  2 Aug 2023 02:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjHBAqH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Aug 2023 20:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjHBAqG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Aug 2023 20:46:06 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D993B0;
        Tue,  1 Aug 2023 17:46:05 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 371NvCfk002712;
        Tue, 1 Aug 2023 17:45:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=HelWeqYvovE+36JTR4WyAAWKmivMO359Vr6CCH+JFn4=;
 b=e1R55xVjwOzGM8BtvaMPfMNJ81q2ULHzEzmk7zJtZ4K9jU2sL6AePrbqrEGglH/kSBhN
 LpEDgWsPmvFpu1cZ+sSU4kY1dx8tUFh5Nor+gxCqvvQVUgM+vYwbDnxlYEj9Vi2WN11f
 KnNBbmxRHJ7TLwaRFISGvOQ1cJPQkJO9z0w5Va3yU/E5Sq2tp8VO0k5LWIVjEj8Nchsp
 pnGijZTfmO+PnnDCW76KgM6nDnnBq4MNPemlwwzj2bllllrXx1AW6cmrw48r+Hjj0AnF
 rsY+qOd6c2G7wGJhNxAGo4LD5jR2CEmX/VLiIUNJQdES/wlKPIufOBbd3yyd/qNCDAys Ug== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3s5213pe6g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 01 Aug 2023 17:45:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1690937154; bh=HelWeqYvovE+36JTR4WyAAWKmivMO359Vr6CCH+JFn4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=lfOPCNpd749HjrgBRibwZdxVSLoozusI88YQL+w6pudRm+euk0vYBRBKr/VpAMx+y
         3AlBAjypaMvnoPcWvgl9UNMMNIQoEkxXjqA55ciN2bo4rSW2y2hi3NDQ7eD+iIJ5P8
         yE7x3nbIN6r6mdAL/MFk5Bhc/3I0lFqee7NI0KS2hmDcdzYFfVjiiNux5yEwFmePsj
         03i6j0v8HRrCMqA30t5Qj8uJ/spH6aL696gupRlE7mlk9nmaOhYF5yhfxldAtMqUYj
         vvkfSlyUgP9+CgvbD3bk8pGe5ChcPN3qYUhafO4VrHtSTD5CsQ/ryMXithHsWt1r2m
         gsQ+wj8xd+cwQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E3F1D405C9;
        Wed,  2 Aug 2023 00:45:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id D8E9FA006D;
        Wed,  2 Aug 2023 00:45:51 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=KRyEKqjz;
        dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4B0FB405A9;
        Wed,  2 Aug 2023 00:45:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfL7Tv2h94m3LNtY389Htr715jk4PmPlV/uBfZ0oWTCNV0xCEKfmgLgtC+c5f/qRrSB/2fmtGVHHY+EPdOifZzV6YpbFjzv3ZTDiVCUMz3uHb9ZVvIaam7n/GNUj2IN5AAhg66MmKWzeb36OwJCAKlAYn+vIC5WX9g2I6u7G+lKaohowwnLjwr5sxCVrtCs0j4FXxaDEHZnqLm77ZAMqP7rSR2iEieNG1trdRd59Pe8Fi4OsQErJ18jOJZUOzsvDG+mDOMoE7COxLxqbDEmy0V1VpFnGGf28d2UCijkQ8kaYvjdu3qbpUs4jiGV/LPrDCnffRz6cD8vPfL1q+gTehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HelWeqYvovE+36JTR4WyAAWKmivMO359Vr6CCH+JFn4=;
 b=gvIDDQSk96zUP3fGK4BS30bPzBsNlyLYV3ZdjVI3J3jhxbAz8/6wwdzpFeL2XZzGht5QuArh1sUKHkTFEGdYac7oo09JC6rWg4zpHjneEcAwWnnAAIyHCHYKZz3oTEuemKF86yuLBv/ibRD6SR1UWZiwqqcSntN+m+D/c0OhysAMktgjEfrRDKvgOWEBcX6DI15xCyusfgRD4Us/Xmlcbur6/cBpCYD0/R/4o/C6hyPD9Nnu+7u/huot+rxu3I5J5ezTbj4ZUS6N3YePAKlRxbqwwgRyE5wuf4T9fpJfnSp3YklBF5TtCC/Z3uX0poy8lyD3K8bYXLQzAuwERpa8Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HelWeqYvovE+36JTR4WyAAWKmivMO359Vr6CCH+JFn4=;
 b=KRyEKqjzu9PzFJTlOMVAg+bU5nJxrwuQe3IGErsuV/Gy20yQ5Gaiamq3OgTDBXJUObxV3GnXeoNSubz4nQ8HW/QgiX42ESLIt7jro2bx1fVaTBCKpujiT4lxCDrtEI5N561rQe9fxKVx6yYhFXLzxyKvuMkg06VEAvXh6JUvmsI=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MW4PR12MB7311.namprd12.prod.outlook.com (2603:10b6:303:227::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Wed, 2 Aug
 2023 00:45:46 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::588e:6476:a6eb:d698]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::588e:6476:a6eb:d698%4]) with mapi id 15.20.6631.043; Wed, 2 Aug 2023
 00:45:45 +0000
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
Thread-Index: AQHZw5Hq0x+4HFony0iQUSJ7/Fn126/WLjAA
Date:   Wed, 2 Aug 2023 00:45:45 +0000
Message-ID: <20230802004542.jpt7em64hfvc7pjr@synopsys.com>
References: <ZMd/HzISn0mPsNWt@lenoch> <ZMd/oMRx8ze22/kK@lenoch>
In-Reply-To: <ZMd/oMRx8ze22/kK@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MW4PR12MB7311:EE_
x-ms-office365-filtering-correlation-id: e6b396da-9d68-47d2-6805-08db92f1ce9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jJ9J2STZxSdN9dDlnJBF7VIx4icBSfBxetVsHMW6Qb69mP2IrHA+1y57249J0lfL5NRfEpAbpOVJZ1/z4jzmV5m9Oa4KBZ1BUicYVqGoKx3NZ/C5x2J52bkiit4we9yD9kr8KtGofmWmVqNA8eR63Zee4X4CiACNGN3C8jWLf8qbzeQ1aC01rb6w/zf6DOSvMyDNw0UTNT3n345O+OMCeZ36HdcsQd9p3823doJ7kCRj72zRaEKkTiGQgp4he824sIfq/R8K8jUTbT1UScUdAYCxIGeknfJUDtpXnJ2S0mjxeRQxQm2nBKgbKex9KnFtVAZbPmof23FFALIaJLbe2E1JoyFlfBbabpN+uxslROlen/Nn8jSNjD6VsWXznBe6UKCeJMzPQ3rh5qfK0/14TQRPE89a0xJM6LaDobC9hO5niK6upaKx4JGQCjkAka5rNz7eP9DmhKa1yattc2l58aEAH7/Uk2yNGx1l8gRbIzjQKE9NKQK2JxaYWc0D8dxEYibtCXQyGmaxy7HvMfjnfKOHbhdVI/D/VhhSoyFyhrVMoL493G8ACjlPmYwfQamjlailQiDiz1ytVmNug+bsPgEWwKkMcbkfKIaMFrPbhrqIoLCuhu54XX7ug25X32P4yGgoTKH8YJAnHFTOgBOV/hNZb9PEbE3ETD4rN1LliOc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199021)(26005)(6506007)(1076003)(186003)(6486002)(6512007)(71200400001)(5660300002)(86362001)(8676002)(8936002)(2906002)(38100700002)(66476007)(66946007)(122000001)(76116006)(64756008)(66446008)(4326008)(6916009)(316002)(38070700005)(41300700001)(66556008)(478600001)(2616005)(54906003)(36756003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VU40NU9PMnYwVDFrOTVhL0VQSnNyWDZxTWN2NmhFblBRM1FnUzRZVkJnVi9q?=
 =?utf-8?B?M0VOdlkzMW01RFZwOG1ST1p6RSthcm5lV0Q5dmRNSmljcnd2NVY4VnlKb0hY?=
 =?utf-8?B?OElJbEwrL25Zend5eUFiakgvN0prcmxvQzJoSUdHdjVnalMvakVHcG56L2Jp?=
 =?utf-8?B?WDNwNEwvb2sxUFJHZmlxUGZka01OWlZHMnJSWHdhS2RqdG5CNlp6aTdrSStQ?=
 =?utf-8?B?NXVEbXJ2L2NGbW42QllpMVZJS0k0SmxlV3BUZVVYU2tlTFJpTi9LNit4NDFF?=
 =?utf-8?B?bCsvd1dHRWprcS9wK0VjME9ETlgzY2FBaXNVdzkzdzVSK3Z6dHJXdkpFa0tj?=
 =?utf-8?B?d1psRmttNFBPTHlrdGtSWWpSK1gvZWdVaXhPdnlPb2NiYWVtYXFDSkgveDJy?=
 =?utf-8?B?MzFYOGZWYXczU2FrbVBsc1VSTnJkNDdkZXlMRW9DZ2w4OSt2NHd3dlM0WDA1?=
 =?utf-8?B?VURKRnNXa3V1MnVObXFPc1B6dUpNaEd5Z2ZEOENid3Y2U1ZUYWJxdXVpcTY0?=
 =?utf-8?B?bWNHT21iUmNSYmRpb3JuWldWSDVRNGdqbGo2N01JT1V0WFdRZjBOUS9HZjZY?=
 =?utf-8?B?Z21Ua2hVMFFKdFdJVWFUNWx5TTBJWmFKT0F4UVBQSTI3Q250M2dLWEc2dVln?=
 =?utf-8?B?aW9YMFR3T3BPK2VkcmZxbTNscVA1TVptNlZXOUs2bUhTQTh4UWN1amNsc3Vr?=
 =?utf-8?B?cm5LRVREVzRlUk53elI5VHY2V28zcExCWDEwMDREWDJnWUNNTVAzaXdKQVpi?=
 =?utf-8?B?Z210U0V1Z2V6cm45TU5tQWJTMnN2eWRyNmQzWmk0TjlDVnhvVmZDcUhsd0JL?=
 =?utf-8?B?K0JkbXg0RnkyL2lKYjQ3K2t0MmxaQnVJck0rdnlMTERqT0wzZ2VySEkwTFBE?=
 =?utf-8?B?dEIxVEgyWkErMlp0dmJSM0VrVDF0WDBLWkdUckU3SnNUaDRUa2JYR0VnMC80?=
 =?utf-8?B?WjBjWm9FdmorK3JicllrL1RBZDYwZlMrWU8reFRqM2F4VEMxR1ZNNlkwSzBq?=
 =?utf-8?B?cUNWenRFZ1VOR084RlhpelNBdExCWk0xbVlGMm9pQXlnQU0zeDUyd09XZUFR?=
 =?utf-8?B?Y0k4UGczRUQxM3RVeWJSdDRLQURsOFVlUzNiZkltaGlNYmRMZURFUlBYbXR4?=
 =?utf-8?B?VVpITWk2U3ZJa2lwV2E1ak9KTDJlbjExTnpGNVg3VFE3VXZEQ09oekFuRTRQ?=
 =?utf-8?B?M1p6TkFBU1d3bEJCdmcydnhPeXhPanRNY2plR3VZWTV1cHpSSml6MkN1Tkp2?=
 =?utf-8?B?dDBpbXk2VGZCNzdOZDVBbHVaNGpFVnFQQUhxekRPSll6OVJWdlgrcmovT0xF?=
 =?utf-8?B?WW9SVkdiWHRhMWJWbVdUczZtNjZhUXcwNEFWQXJycHZleHRjU0ZXSk1yNEtR?=
 =?utf-8?B?M01XNmRYcHdDdHlacjNsSStsUmtTWG1JZW1EVHh0RVFlS1QvZVdBL2xnVURr?=
 =?utf-8?B?UVdXVWNYWWpsWFZDSkVVYWFGNDhkUW1rYXB6dFNCejFQMnhGQ3YwRFVNUHRP?=
 =?utf-8?B?RGR1Y0prNlFOSTd2Y1JTb1JQek15M05LMkJYZUVCWDFNUE5iYkRON0RhYzE1?=
 =?utf-8?B?UXQyaEtPby82U21JTTE5M1kvV1BsNmNpdFZaVUl3WU90djNLd1VKUmxSdWpY?=
 =?utf-8?B?ZXl6MmNyVS9odnc4ZlRHNW5aODdKd1M4Z3pYWXpMOU13YXV1Y2NsYUh2cDlL?=
 =?utf-8?B?V21QRjMwUGVGY0I3TTkwTXNHN2xDM09Cc2dVV2g5eUxTZXJsMjFZbDZjcis2?=
 =?utf-8?B?Nnp4Nm5WcDl3bzhIRVVhMUswV1hNQjJlUWVlU1BzS09ZU3ZnOUxLVnZrWThJ?=
 =?utf-8?B?aS9RT1NENWlRMUNaQ0xzSHZLRUYydExXYU1zSmo2bUZ0U3hQWlNRcXhCRFJN?=
 =?utf-8?B?a3MxR0RSNGR6V0dEc0FnQWpWRmNVelpleFM4L285TE8zekZQaWZGL1NHM1dD?=
 =?utf-8?B?anYzVGdocm8vQjZVa0EwYTlvUEZhaWkrWUFlZ1huY2Y4TXJ0VHpNSjhydXpo?=
 =?utf-8?B?S2JkK3hIRTNmT0tra3lCdk43aThMWFJmd3hoeC9GK01iYndqUnJ1OGQ4YW85?=
 =?utf-8?B?Q3p0Q0FpTHU1Snc5M2dnaVVRYWVrc0VrN1JkTGNVNUJqTFRLdTlFQS9kSW85?=
 =?utf-8?Q?4tsTj2xPUSZS8PuHAkTpfO7qp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4F7A3DF7B9DE64BA1ECC24A5973EB93@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?dGdKWXJHWUQxUFp2TWJvU2M3ZkEzTitOYjRKclpqTnpXSVF3YW5tazRBWkRO?=
 =?utf-8?B?c2R5MmRHYVZGQm5vamFNRllxUTN3RzJFYUVITE43Z3JYMWp6cThIZTdWR0g4?=
 =?utf-8?B?bFJWcVVjcmhMN3FWWFpVTi9LeWIwK3pwazNDb2hBRjl5WnluMnpJY3VRbjdl?=
 =?utf-8?B?YlNmM1M3QWZJeDg1V3Rpb21TNmRGOE0rQU13eG1JOCtmMy9PWjFKanl0WUNs?=
 =?utf-8?B?T0x1QTlwVGh6VmV1K3d2VzNIbE9abHVia2xNa1dYSkFWOHAyNUMvS3V6R0RX?=
 =?utf-8?B?WFRWelh1Q2V5Ti9obzZpeTk1b1hya2xGS3Ewcy8rWmgrakVWNmg1QktVQlM5?=
 =?utf-8?B?RWN6Y0F6WVZicW9MeVFkMWF4cGt4NG9vMEhqdXhZeFlRTzl2RGI4c0ZzQzVY?=
 =?utf-8?B?dDJ3WEhTZ3Q1TU16ZitLVUo0Q3lJTCtaZmhrbHgxVnhyYTVibGl4OUpmMHJT?=
 =?utf-8?B?NFJhbUVJMS9tc08rZmVnQ29GSkYrZGJYMm1ZdnY2WkptOFk1S3IzNCsyckw5?=
 =?utf-8?B?V1NnS1JFcDJ5dGZRUmQvbnJxQ01YN2d4ZWdtUW54OGhIZnQ4bDZaRXBtcXRt?=
 =?utf-8?B?dVNjN2xYbTVjamkwMHNzdU43UHE1elhmeWZBdndMRXV0UTdwMjRHeis3VFQv?=
 =?utf-8?B?MzZwNVB3RGZUalNFNU1GN2p2NVEvVnpvTk10VHl6aTM5R3prMTVBdUlDVjNa?=
 =?utf-8?B?RUIyWklLQng0c0Nwb09hVll4KzFyMlBPc3VRQmczWW8rWmhRdFdGajg5NVpt?=
 =?utf-8?B?ODBGcVBTMk1CVGpGZytqV3VZQmp5TWVoMHA4UTBqQXdkbGtnTlRjN1pZRmh1?=
 =?utf-8?B?dnR0Y3FkWjVKMExIWWhST3NFa3FEKzVZZXV1bVN3ZVA1Qld5Qnk4ZHJXQk9S?=
 =?utf-8?B?Vlg0a29jNXhzQVNERjVhcWJsYmVOdVlqOWFqUnVjamdpb2FKODZkaXJPSllV?=
 =?utf-8?B?SjFScEhuV2ZsNG1jZDYvRnQ5OXRsS2YvVHZaT3pZbjI1aCs4cTdQbm1Sb1VW?=
 =?utf-8?B?eEEwSHVJUTVSV05qU3VWajZuRHNMNGtaRWZZSzEydmwwTDlPNUpHaXp4NVZw?=
 =?utf-8?B?VzFIeTI2QWo3bURXK1hFZ3dkUS84blJQZHdoeXYvdk9KTE9iOGtFVnlaSUpL?=
 =?utf-8?B?MXY5RG83Z3g4TXF4ODNnS0hJOEVTRkNqWU9uV1llMjhRdFNqMXZyY1ZlWXFr?=
 =?utf-8?B?WFhHajBOMk1yQkFEK3BiTWVhWTdjWm80OUJLUnlRVVh2bi9GbUVGQjM5a0wx?=
 =?utf-8?Q?zU2QNe1Tm/omvM0?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b396da-9d68-47d2-6805-08db92f1ce9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 00:45:45.4046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T7YJhICuf7mDAi4aTnyyL8n9Me/LqIWAuZ4K/Lfd0B0Vo3x0X6dIybSzICaomlEWFVC5zMIS/YIPCkhRY91u9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7311
X-Proofpoint-GUID: vZNeLE51v888TOZ1rczRfrnJ6MfhlFu1
X-Proofpoint-ORIG-GUID: vZNeLE51v888TOZ1rczRfrnJ6MfhlFu1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_21,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=923 adultscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308020004
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
IAl2b2lkIF9faW9tZW0gKmJhc2U7DQo+ICB9Ow0KPiAgDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5
ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o

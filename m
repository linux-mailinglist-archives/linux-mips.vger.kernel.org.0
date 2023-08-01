Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7F0576A5B2
	for <lists+linux-mips@lfdr.de>; Tue,  1 Aug 2023 02:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjHAAob (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 20:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjHAAo3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 20:44:29 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF588199E;
        Mon, 31 Jul 2023 17:44:28 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36VJppAO024101;
        Mon, 31 Jul 2023 17:44:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=uTxCnEYFJSbY5W2OHuc/ISK5pfmCIPtx+2p7gy8p8Ko=;
 b=p/tB1lj+5ywXhFzmQ4TP+u/2K28TQXpdwpw85N/QiLUUlQ2v1JGWx+RDrv+BI2y2pnQv
 E4TmYEQA7JDM4x2jIXQ7ewiMkuQYJHltD/tW4+uoenuiQ2YX5UOqNeuYzL+HMDdMMm+Y
 /5JVCAKwPFUiIBivRMMwYmjg529d/eOPh4ekLZdvHQCCOwbzfZRB5VUaIKAZpo6xtwzu
 6Wuy+pEYBtAMyhLPsSz/ebk6DdN81zLwt1lX0sbrV7Jlds9/RczcxZtLezVAMgmjgy6o
 7AqIiKGHQ3CTmevacUqiNf6oxNGwsrpIoWm05NL4UkADW98fnKtSOHBWHV3IK77eDvi1 RQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3s51pssuc5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 31 Jul 2023 17:44:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1690850659; bh=uTxCnEYFJSbY5W2OHuc/ISK5pfmCIPtx+2p7gy8p8Ko=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=XZVz6N1pTVFy48J23DVYp6eu80By+cohwoWIcVKdFrCmbOf64aKnLudpFb5gL8o2b
         iDDYfqls35WULv55tlYJVccCTX2Egbzt5bvEQ9w9NV14I3B/xy2+KFtrJcSMCkGjQf
         ZqEbFx5llaZy5wJwY0ugp3LqUl8NAzZ34VoYkLvQhLzyS/UU91mrQcwvaWDajXGV7n
         NgJ0v/oxVGai5YxQRY3cvniDukYE//Vv0Z+mhi3FawVJ8gsBZ0eUb5k0rhQn4QTEXn
         +a2PIx5T73ejxCd14s6g4gtz1knzElozC+5Ct/LsUS4YmRXDVqSNBeiwmYaCTIXKwc
         AhLeFCzNM4vLg==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A5AF94064A;
        Tue,  1 Aug 2023 00:44:19 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 676FBA008A;
        Tue,  1 Aug 2023 00:44:19 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=peFJ0+lj;
        dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 37AC94048F;
        Tue,  1 Aug 2023 00:44:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQ+sj6T/evly6m1yc8yGXoo+rv8HRVZPvwVuhPk7Y0BMHqAxAz5jd9RTo1gG0tjDtvw1AnJ5SarRgxrIOFpJoY981dguw+3BDTpQVfuRKZc1ypaJ53MGexJqyHnAKALNBmKkTMCmyxnx9crz+brlvmggsUtq3h+91c0Q2eCpcYm5FxnYhJe4pvGjWbmOOjIfCV6lsqqLO25v41lUN6xP15hvIak3KM3veTDL+u86Dn6iOqdxgeeMwQwyZ/BF0aEaZdStI0131Xa33Z4FhqleTbOv87oeGDxFq6Bp1ey3dkwwI2Uiv54IWb+GRfNEYwDX2V3cl8//14VbB4q2nb0uWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTxCnEYFJSbY5W2OHuc/ISK5pfmCIPtx+2p7gy8p8Ko=;
 b=MyP5Pp71uweJ8KePFWjXudsGhk5mcmVjRj2+xISYX20gA0rvGk4qBn/Rc9SJrDjDu0ocTj5J0KyRrQ5dMkSTDNSP+d0kVzLDROaKc2X7kERlRcIQKkH4qezIed96s5vwjusCPpqSnvBCw3DM4SaSCYh8r8kT9gMCb2x+r++7wLmx9qjYLhA/tT0GD8tbtI29IVIGVEM9nATTpv5v7R8XF1v93eBimVWJKMZgcvUMbQcnBFDTyAjDbUqvZ+QTXDL40Dpza1N+a/QSJX3ApVrhowTT+6L9dNBR+PDr5SQifb1Fa8Im5whziTSN+5fPX4eZPanGgiwV8VfosqZOkfkZTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTxCnEYFJSbY5W2OHuc/ISK5pfmCIPtx+2p7gy8p8Ko=;
 b=peFJ0+ljioIiX1syVydQ7qPtQU1+myUneJtFPEMPn1oHDWL2xQw8wrz8/pdUnom/Wr2i8oXOq3cjFYIUq84WjIW+Kp/l40vh7q2HrfokmK+YvOCCmj+tFI2AItwYc7h0Xxc8+ivynwALzhiY/sY47nf4ECqTdiUrvvi+lYtuEj0=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SA3PR12MB7904.namprd12.prod.outlook.com (2603:10b6:806:320::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Tue, 1 Aug
 2023 00:44:15 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::138d:ed63:a424:1f33]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::138d:ed63:a424:1f33%5]) with mapi id 15.20.6631.042; Tue, 1 Aug 2023
 00:44:15 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5 6/7] usb: dwc3: dwc3-octeon: Dump control register on
 clock init failure
Thread-Topic: [PATCH v5 6/7] usb: dwc3: dwc3-octeon: Dump control register on
 clock init failure
Thread-Index: AQHZw5ISBXWXh6puaEq6qgkit5oIqK/Um3IA
Date:   Tue, 1 Aug 2023 00:44:15 +0000
Message-ID: <20230801004414.xi7njkla5gdu6rpd@synopsys.com>
References: <ZMd/HzISn0mPsNWt@lenoch> <ZMd/5OX9szEMnhQH@lenoch>
In-Reply-To: <ZMd/5OX9szEMnhQH@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SA3PR12MB7904:EE_
x-ms-office365-filtering-correlation-id: 49765613-52b8-4ae0-f329-08db92286e95
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dHcm/rSb5WqYIKBLZYQ57wrniZ0OrmFE/Bnyk5cAP9dORLIPEJeAP+yjGf22HooPx70nWXbq7bsE/qVEl0ailJbLUjPhd3BTfOtygkIIA0sOI7a63h8tgIMsmwd7l9wMEXe6MmlCgLhdv0CLwr/tczMq2IEN3G0enb4lAM8eioiM0S4psyHLpn77qtts+q02mf2z3eY2vB9btxB8nE2ozF+OZjXEZfUZixfOG3++2O1Y5ypu1KCSaIEIBuQmrN0DaTlFLjA6eY3BqrDVNXzsoB5xhAZB7SAoIA+nbRPO83TC6+4xhDU2+l0klkFr1+Z6eGRFODQ3Vze2CPYS7uE7T7M5WstB3MW1jfAIAVYPmgnp3/06QqbVzdBIwYsiMKyosNo5ygqz72q9K7LfvOGGHkldIOZ5KTn5AttMGvs6UYC/wR9Kj2FGSbFp/L7HDC9Hfz8DZFs8i00HU+DRyUVuRQ0AVXVjU0aTmQxBQ0neu5F4prHg4BZifIe/UAe7Sy10qa+xnGpNgY6R1WoXPFYJKRretTHKJMJuEdm2qP9BZu1ms/uYLubSmUO8da1xL0k/mz1a3yll8QJ//qX7fvPlLVProG4lvjWSblK1KrVh//GU8imLBJ8Q37bpBU6FgR/K
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(6512007)(6486002)(36756003)(2616005)(6506007)(26005)(1076003)(83380400001)(186003)(76116006)(66946007)(66556008)(54906003)(122000001)(38070700005)(41300700001)(38100700002)(86362001)(66476007)(316002)(5660300002)(66446008)(6916009)(4326008)(8676002)(8936002)(64756008)(2906002)(71200400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFpNK3dWdmJ0cGZ4R3NDQVEzclc3OHlQOGo2R2JTd0lGZTBBQWgyMHBjTzI5?=
 =?utf-8?B?ajY5NnhmSUM2dTRDbXh4dnZIWCtGQ0pra0NGU0RiUGo0RmliYTNjekpyRXVn?=
 =?utf-8?B?U1Y1NlBoRW0zNDFKTlg2MSthTTZKUDMzMkV5WW1lV0YyTkxQa0R2RGM1Nk1s?=
 =?utf-8?B?aFNLOG9VcTZVdFB4ckpSbnpOV0JHL0o4N3d5K2ZyKzM2VmtGa0d5Qk5GUGdJ?=
 =?utf-8?B?bG5ubW1QTWQyVUtPbjJHV1k0WHdWdXIyNS80aFVBZXkrTUxidXBxMklNSjg4?=
 =?utf-8?B?QzJITzNtM05yRzlveTZKWHVrZVFzMzRSVkZnSFZjQkJRbVBsN1VVWVZwK0to?=
 =?utf-8?B?MUZPb1BHalQ0bkt5MmdLdkJZUG94V3JISnVnRHo1NnIyVDFOdmZMS2x6WDZ0?=
 =?utf-8?B?cUp5T0tnLzRJQnFFQ1dQZk1DNGNkN3BOaGpxTEcxNlJ1UVk4WEoyTHAzdXlv?=
 =?utf-8?B?VzkvaTd2M0RoaEUzNVFwNlhjUkZXMko0R0tLekxxYmNZTjFvZVczaVhOZmNS?=
 =?utf-8?B?b2YvbUFtbUpGVk9ibFhuWDJONE0rdUtoZ2d4TnJkVVdaUHdLWm5MeXJxaGZC?=
 =?utf-8?B?aGZEMjNlR05NL1grQ2wwRFZEdUlrbGE2RS9DdEdSWEtwQjhJeFdya01LdFFU?=
 =?utf-8?B?V2dvQ1MxSzR1R1dXdnl3dFlhUURDT3g3NG1VTmxobWNhazZ0R242MC9WNkkz?=
 =?utf-8?B?U3lvbFcwdHh1bTl6RjJZclBLOTBMQ2xKUW9IaytOTGVsSkNtc1Y3TDFXTUNV?=
 =?utf-8?B?YjV0U29wR3Y2ZXNSZ3hQbnVnUERUNGRVNjhabXNkdUFWVkNuRGtoaVNCdTJa?=
 =?utf-8?B?OWpLN3ZKSzRoRXRodmdrNEd6MDY0VUdlZzdKeEEvaTBwbUplN2cwTVlHMmNK?=
 =?utf-8?B?V3ZFaXdiUjhhNWRHbVBHTmJXU0Q5cVVoQmpNMVlHdUFmNFF4VlFLZ1BaSlU0?=
 =?utf-8?B?eWxMUmVEaDFtV2xYUHREd1BKcW8wbEo3SFNUelFERWlvYU9CQU1WaU9jS2lj?=
 =?utf-8?B?RExmaWROSks4NWJZZkR6aUV5MzJORGxZNktvenJKYzZZNGdEZEhxUjZRUWhN?=
 =?utf-8?B?SU1lM25BaUVvclhjK1NOZ0cwNnhQMmUxc1o4OHVGb3BGeTg2Zk5xZndjdndj?=
 =?utf-8?B?M3lZZUF6NXpJd1c4MEFXVnBUL3hPVkR2L0pLZ2pHdU9VOVpSMWh5TjVibUQ3?=
 =?utf-8?B?WlVHTXZTcnYvYlV1WjBFcXpEY2RYME1VVjdxQkFpaUZmRVp4dFpINnhIK3F0?=
 =?utf-8?B?d0dTTFc1MjRkRFdIamx4UVhDWkxZRVpMOG9aRUZRQ0hLVjlzamRubHVXbi84?=
 =?utf-8?B?djliYlhjMmFtaDNTOFJpK1paTzVHOUxGTGZMR1hCVXJKaGh2NTlwZlhacW9R?=
 =?utf-8?B?ejVWaVFYd2VvNFE0ZXNPdEVDSVViMnNPSDRjOFBYbURTUWY3SmFwYWJJMTFK?=
 =?utf-8?B?MlRnV1VmajlrcjRpL2FENWFvbEZ3anRSTzJRVk1YMFlaYVFsTVJVdFRaZk9E?=
 =?utf-8?B?K3BVdnpOMy9MVHVYUHcrZzlWczNkck1VL0wydHM3am04SnBTTDFDZktRbjQv?=
 =?utf-8?B?UDEvVVFhVHcrMXhCVzlqZDErS1NJempESld2clFrM2p1KzM2T1R3S292NWU1?=
 =?utf-8?B?Q042ZG1xSGR2MU1mOGJCSG5YTFRzUXpIWk5ZdlZYeVFIZGhFUnBndk5FMlF5?=
 =?utf-8?B?S2trSW9sMmRja0tGb21XbUxFa3N1Yy9vSmY5QUdqNi9wVnRkalZBUnMvTzNP?=
 =?utf-8?B?WWxJYXlSM1pCUS9ZeDRmT2t4R1RsRzBMbUVhNittNTFwVVU2dk1Nc2gvM1hw?=
 =?utf-8?B?VG54V2o5LzZlZ3I1T3VUb0lxK2taVFFIUm9RZTd2THI0YTNRRElKcFBnTG1p?=
 =?utf-8?B?Y3dPeENvVE9iKzl4ZDc5L1ZnNjFzY2JkYzZlUEdWKytjYUZXSEU4ZERCT290?=
 =?utf-8?B?eDBFOXJJYVV1MG1LUmFEWExIUUU1NDZjeGVTd29UMGI1WU9sVFE0d1AxZk5o?=
 =?utf-8?B?eThVMzk1Y0hhOVJURlhQUjE1WHhSZXV4UFJENGVUTTBUSDM0YlczeXBZM2Fp?=
 =?utf-8?B?YXprelpnRm9majB5VzBpd2x6Tnp5VnluNFhjSHIzV0NOclhoMWhob0dlRU5Z?=
 =?utf-8?Q?yMwWfcXj2QOV3ECbqOKUGS64N?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF0ECF1AD7B6E34EB128708D9C4ADE7B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?TU9SU1Q5Nk80bGI2VDIvMGxIdFh2T253anBrSmNKTDMrT3Z2Z3k1L2I4OFIw?=
 =?utf-8?B?QzFpd1dXM1BoYUo4VElZNnpHbjJHbDN5bHJBN0hYdzVkTGNOWFNYeWtpWFhN?=
 =?utf-8?B?MVJXNjgvRVFIRmROZTQrWUluU2VOZ3hsM0xvNGtpamRVNjdFaUJRUG0wdG5r?=
 =?utf-8?B?TWhPRTU5M0JDMkF6dFRsNTh3UW93OGtXcytIRzdwRWZkKzlNdDcyN2VKTlhT?=
 =?utf-8?B?a1YxeGp0VWxNTkN0SkFOUUg1bFVtNU52bGNjM2MrMU5ldDFSTERPYmdZZGZD?=
 =?utf-8?B?eURKcGN3YmJ4RGp0YVVOZlBvQURkdXVXaFhjc2FabnRvZlZmWGdCSklsallP?=
 =?utf-8?B?NUtjMGtYMGMrVkpUYVRadUtwakpjbkFmcExlenVqRnQ4TXEweVJOSE9nbXdu?=
 =?utf-8?B?enFlSVhtWkN3V1BFelBVRkg1b2FkaGJxUDNjK21xSUM3cGNHRXlwQzBzN1U2?=
 =?utf-8?B?UHc4RTY4aTZzSGFROThuNzFJNVkxRW9YUkRvQTQ2Q3lSTkJheDMwYk54WTBq?=
 =?utf-8?B?V1N6bElmUmJQcThkUDI1dCtPenU1M2F4UElrSVpRbmd0MkVSYUJLeGpqTHl6?=
 =?utf-8?B?ZmJuRkNnU251d3M3Mm4xeTYrTGpUZFRTRXJTMDg0L2hRTHFmdS9mTnRtdUNE?=
 =?utf-8?B?bktSYXdkVWRUL0V5allCYlZqT1N5RGY2VlZmdUdyWEF2OUtucWlsd3piMlVj?=
 =?utf-8?B?ZjFjUDVhd0ppSkhLR3hUeVN3N3RBNU81NnlNL0lZaVNGRVBxbUtuVE5Bc2hG?=
 =?utf-8?B?amZVOXBnUHFTY1NZZU1WVjNMeFJ3bWRqSmFqMFBqeVMzYUw5Smx6TDE4aGdQ?=
 =?utf-8?B?ZVpmS0Nna0cwNjJmcGFGaTM5ek13THZlOEFZUzJJMTBlZExOQUxxcStjSTh5?=
 =?utf-8?B?dmU2WXZHMDlFWE1FRDhaZ0ZJSTlUcDVGU08xYnR1bGpPaDlHUTNZTkY1Z2w2?=
 =?utf-8?B?QzAxN2w4WEUvTnFKeWlKQ1dCOUt1MFFOVW1sU1Z2YVJpM2FRQitvQ1VmMW1T?=
 =?utf-8?B?ZjRCaXVrM2hXUU9yTmF6Nk1MMWd1d3V4WktOL1J5M0ZjdnllQWJQeWJwbHBK?=
 =?utf-8?B?d2UxTHZWUjBPVll3RjFrblpaWnRKejBRZnM4U2JUYy9nbVNiY3ZCRGdsTUJ2?=
 =?utf-8?B?RWgwZCtHTzcvaGhVdUFPa1JSdXdFMWk4ak0rTjV0T0FITUM5SWNXb2NocGFk?=
 =?utf-8?B?K3JmVXJYQk1yMjV2VmpycnZBcnZwS3I2Q2pCUE9BUjJkSHBRSUZidko3OWFZ?=
 =?utf-8?Q?FI5SL5eEldeZp14?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49765613-52b8-4ae0-f329-08db92286e95
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 00:44:15.4425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8D1EDKoJ+pvgnjbYqPMewLSAWJ0JAbVNEJTaY0WsvUTik7iRX5YflZKT0BJ2e4dJ4fHKi4dXy1d/Qh5vLSWIeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7904
X-Proofpoint-ORIG-GUID: _zyvWsu5s9Y7YC-yWGAwEbJIUpzEES-0
X-Proofpoint-GUID: _zyvWsu5s9Y7YC-yWGAwEbJIUpzEES-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_17,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=791 classifier=spam adjust=0 reason=mlx
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
c2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IA0KPiBJdCBtaWdodCBiZSBpbnRl
cmVzdGluZyB0byBrbm93IGNvbnRyb2wgcmVnaXN0ZXIgdmFsdWUgaW4gY2FzZQ0KPiBjbG9jayBm
YWlscyB0byBlbmFibGUuDQoNClBsZWFzZSBhbHNvIG5vdGUgdGhhdCB5b3UgZGlkIGEgbWlub3Ig
cmVmb3JtYXQgdG9vLg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMYWRpc2xhdiBNaWNobCA8bGFk
aXNAbGludXgtbWlwcy5vcmc+DQo+IFJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTD
qSA8cGhpbG1kQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgQ0hBTkdFUzoNCj4gIC0gdjQ6IG5ldyBw
YXRjaA0KPiAgLSB2NTogUGhpbGlwcGUncyByZXZpZXcgdGFnDQo+IA0KPiAgZHJpdmVycy91c2Iv
ZHdjMy9kd2MzLW9jdGVvbi5jIHwgNCArKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3
YzMvZHdjMy1vY3Rlb24uYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYw0KPiBpbmRl
eCAzMzBiY2I1OWNjOTUuLmQ1NzgxMTBmN2FmYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2Iv
ZHdjMy9kd2MzLW9jdGVvbi5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24u
Yw0KPiBAQCAtMjk5LDggKzI5OSw4IEBAIHN0YXRpYyBpbnQgZHdjM19vY3Rlb25fc2V0dXAoc3Ry
dWN0IGR3YzNfb2N0ZW9uICpvY3Rlb24sDQo+ICAJdmFsID0gZHdjM19vY3Rlb25fcmVhZHEodWN0
bF9jdGxfcmVnKTsNCj4gIAlpZiAoKGRpdiAhPSBGSUVMRF9HRVQoVVNCRFJEX1VDVExfQ1RMX0hf
Q0xLRElWX1NFTCwgdmFsKSkgfHwNCj4gIAkgICAgKCEoRklFTERfR0VUKFVTQkRSRF9VQ1RMX0NU
TF9IX0NMS19FTiwgdmFsKSkpKSB7DQo+IC0JCWRldl9lcnIoZGV2LCAiZHdjMyBjb250cm9sbGVy
IGNsb2NrIGluaXQgZmFpbHVyZS5cbiIpOw0KPiAtCQkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJCWRl
dl9lcnIoZGV2LCAiY2xvY2sgaW5pdCBmYWlsdXJlIChVQ1RMX0NUTD0lMDE2bGx4KVxuIiwgdmFs
KTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICAJfQ0KPiAgDQo+ICAJLyogU3RlcCA0YzogRGVh
c3NlcnQgdGhlIGNvbnRyb2xsZXIgY2xvY2sgZGl2aWRlciByZXNldC4gKi8NCj4gLS0gDQo+IDIu
MzkuMg0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lz
LmNvbT4NCg0KVGhpbmg=

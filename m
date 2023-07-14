Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27D777544EB
	for <lists+linux-mips@lfdr.de>; Sat, 15 Jul 2023 00:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjGNW1G (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Jul 2023 18:27:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjGNW1F (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Jul 2023 18:27:05 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBEC35B5;
        Fri, 14 Jul 2023 15:26:49 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36EJcASV028681;
        Fri, 14 Jul 2023 15:26:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=xawROjFMOIvNzYPAiAb6jpb96JQxQs1C61mvAKCbqXA=;
 b=csCrBNsY7i+TRAohpSnOikMwkszV6+qZMzVkpNBXzwsvkuZ4znTE0Y6mtSH6zIPWiprJ
 /YAFCR4OcPFCnVIqQ3tXFYwwXFfwztYuMQ+eyinlp80f9NGhf5BU6YW2KX6AS0qyV0+J
 S11Pf5D7NxGe/UwFLPWkt7bIPzcROTe6AsbZ22xbgQY/GvtacSlyGraanx4jF+ChA8d1
 pF9ddSubLHLtXDaVJFAIEDigEJATOIQdjiUtrN1QFqT9YfVYe+Vl9LeFfpdtcf6GibfU
 Q7EdBBXeAqiCoGKlbmumfD5ySJfuMS0iscmhXJhcCJOWkH+flSh2ChEbtnNs9JW08AfN gg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3rtpvrdp66-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 14 Jul 2023 15:26:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1689373596; bh=xawROjFMOIvNzYPAiAb6jpb96JQxQs1C61mvAKCbqXA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=GZrkrpiIp/Uqg+HsJ+B60US6iZrhbggEvOyhWMt8cHcl573cNv49UmKU9neacoQBG
         m45CbYWkSn44hrf7KXlmIxaK9bx8FaBwKKCrFWqiw44lvLnD0IA+4sq1f6C3CEJC5Y
         cPLC/LXvRE4PFWcITDnild7j5fFdHh2MZThDOizPETUGNLny/PXsBQ4Wg78DF5qa2w
         28c8+W5wdV7LlK6fLh7djw+xoUmfRDf1cS9GeakNDE5fnfDvfAh3LunHZX3mp+7Mel
         G/3HKgFxsKQLS239HwiwX3c5Kjyw2W4yZtwDAYWlMD4t7t+FzWZHRL/zmyAF1oTqA2
         /mweUjAkYjtTg==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 15AF44011F;
        Fri, 14 Jul 2023 22:26:36 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4C6D1A0071;
        Fri, 14 Jul 2023 22:26:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=l93w1oe1;
        dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C8CD240136;
        Fri, 14 Jul 2023 22:26:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1VnSgA/8RzKW2jS9e1NUUWYtStMxqUif7LG3IA5PWAFBabPOrDQsbFwWKmmg5cX27glmPUCMuzKibglhaRBouemvd4kZsVwkjTUeUhJSAbgdCK7y8A0dlx0Eu41IO5P1R4A8vUMoDz7RAtGHvKLadCJgHklw+lGPN9PBHdOjiuwGBK7NHgEhSEutjX4oE22CvcgDYr5WCXWkfBK4GLLlYIg+IZnJZwjrAifHkwBcTlT8i3xkhsG8aSTlSRWiyGcTWwkXzCscZ5FTBrDkWqz1NL1Tff/noYE0CAlC8kE+h7TiKsMs3VXsCVOJmCGvd/MHtBeXNSeY6lyK3k5S91H4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xawROjFMOIvNzYPAiAb6jpb96JQxQs1C61mvAKCbqXA=;
 b=jHgVpA83+PkINbR4WWFMrXtwY2pC4/PJ4rTNnJzRD0Bb4LRyfr+jlrGtmPxYyQbyCHXdo5mBPyVRILyMCRMBkzsg1VddMIkb5rGNpcd1teLKNUbS6+rfmengPgG9uJDI/8ANbcAk2etryQlnBN6pnr+O7oBRGQkG+goe01M4PnkTps/2ObEoEJLidiFpt/yDaTiiIWgkZ2Xe/bQGfZ5znERk4kSkbpPoQwrfZRdnaFJQhVdjsPNrIDinr7ShuLcH8iLwqOVqV3I+ovv80kYNJofJg/5Z6pMS6yPNsRiRkZV97GJZ9brAhpc2/rV4YL0j+WQPLTybW7mo8czrbmVshg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xawROjFMOIvNzYPAiAb6jpb96JQxQs1C61mvAKCbqXA=;
 b=l93w1oe1JBWZTBI4cxsVyqKW6nMdVYto0tgjU08z3rHZ4af3jgXSSY3QdmZ3QGMB0Ziv5xElt0OGEhA63O1Q4QtCzrIyZIdhR/iO1D+XLsDLKN0cWSvPKB648G0xkiPLOYixc9FaODiUNY2z6tCDvI0vGfYDC1gQohO3ZrOjhvk=
Received: from BN8PR12MB4787.namprd12.prod.outlook.com (2603:10b6:408:a1::11)
 by MW4PR12MB7384.namprd12.prod.outlook.com (2603:10b6:303:22b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.28; Fri, 14 Jul
 2023 22:26:28 +0000
Received: from BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::7a8:9367:70bf:2491]) by BN8PR12MB4787.namprd12.prod.outlook.com
 ([fe80::7a8:9367:70bf:2491%6]) with mapi id 15.20.6588.028; Fri, 14 Jul 2023
 22:26:28 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] usb: dwc3: dwc3-octeon: Move node parsing into
 driver probe
Thread-Topic: [PATCH v3 2/3] usb: dwc3: dwc3-octeon: Move node parsing into
 driver probe
Thread-Index: AQHZtiaUNvp9hrqvUEuRJa6M3Y/Sqq+52CQA
Date:   Fri, 14 Jul 2023 22:26:27 +0000
Message-ID: <20230714222624.6s4n323gzg7n4ngh@synopsys.com>
References: <ZLD7RHvE4eRPoqKN@lenoch> <ZLD8D+zum2dN0pE9@lenoch>
In-Reply-To: <ZLD8D+zum2dN0pE9@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR12MB4787:EE_|MW4PR12MB7384:EE_
x-ms-office365-filtering-correlation-id: 79d07170-e0f5-442c-d10e-08db84b95dd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E8psiefrbsgKqQeOeaPJUPQ0+HMIc27wfA799LtQPxHx0mGQ3ao7otCDOyGDm+rqr/1ly2hIZ+/EpTm2e2TZv+jkau76o5FTgAK8zc/mINP3LuPjDnHsGksF++vYs0G0Qp0RrS9e0eo+1dwhtJWHZnr7wBa2E8mMrPtviOGroUkojZTwK6baPFL3gblQA/jf/aABGddEiHsKIXpu6ddFpYSkC61f8AcI2P8I237PyIbFXAUcoyFC0B7PZZUn8I3v3MvM8scRpzZXg8npdGLXH00hPNY87XRjsi+/R2fm7CuHJ2d7FcBB1gAQYtsbmssfFLMxsYxY0WZg5qOTOc9TxMu9bAvcqOYLxHk18aHN1hKhWlrcTtNPiJkOrU7B9Da47BxMgEWdfFwEbY2IaUOBXrp4jMkE5K9bLk/95Rurh8ld/MYL6ghnPMGfEZTEma0mcLGm1T9BL++TCQqMUsQRRwzTj9I+F2bVjjx1Km7L8Y2hz5+L+GlQMiPIjB7YasTAwFxa5s4IWAz0FwL5sWBpHCoZnibYoGuyFKFEUk5uJqjxYcSXlMCmMKwHCOTWPTyYowxNP1w9HiYCH18UwKOilq/fo0JhGoOPJLzvBoav2OH1Y0eLqFpykRXOP9f1aFuW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB4787.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199021)(86362001)(36756003)(38070700005)(122000001)(38100700002)(71200400001)(6512007)(6486002)(30864003)(478600001)(2906002)(26005)(6506007)(1076003)(316002)(5660300002)(8676002)(8936002)(54906003)(91956017)(64756008)(66446008)(6916009)(4326008)(41300700001)(76116006)(66556008)(66476007)(66946007)(2616005)(83380400001)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXA2RXdtbmoyL2QyczV6SVBpUGJ1a0Zia2xDdTJWL0VlTVJZVC9YVU95d3Iw?=
 =?utf-8?B?ajV1UlJCckVFS21tWmhLQ1BsK2JYc2dJa0hSclM1NDBueDZONElUSldrL3JU?=
 =?utf-8?B?UlQ4ck5YeFAyb2tNMTJyZHE1NTJaVTFBaWpONi95bWNoWXd4YjFLRmVmaHVJ?=
 =?utf-8?B?S0MzR3gzbWxMaGJHTkJRQlA1NUwwaXl4SkNXSThyYWpmKzZsbllEbmlZNHYx?=
 =?utf-8?B?QU8vQkxNczRDZWdnRGxLVzV4VnN4RmpFSnoxMlkrWDZ3cGo3aHIrcGwvaS9h?=
 =?utf-8?B?ODJWYncwL0JOVHFjN0RCeUZvR3B3dzl3SDhZRlRndUI2V21TWVhOVkpGL2g5?=
 =?utf-8?B?M0wvc2lvbzBka1ZIZnhFUjBsR2h6UGNmbldwSFJjS1g4cy9uemw0MkdLb1Bx?=
 =?utf-8?B?dC9ST0R6VHp2c0dMaTlkbGtTWDA1Mk9zZkJZS2YxOGtpR2NXNXp6NjJpK0Vk?=
 =?utf-8?B?VXNwKzUwbkRtbjJsOWJIaFd2UUVsU3ptN0w2c1hweU1RRUVrZ0w5WCtuV1R3?=
 =?utf-8?B?bDc0RXBwMS9wSHF1eXNPMm93czJMWmpaRVVwVUd4NVM5ZER2U2dmMXBOdmUr?=
 =?utf-8?B?b1FISnhpZ3NHOW1qb2ZvWVphaWhEYjBweEs4V2VKLys4Vngxc2xudldURGNw?=
 =?utf-8?B?WUZNMU9QSy9TU2JwY0c4NjZ5SjUzUkZTZ2JUV0orYmtTalJQWGJTNzNuaWhw?=
 =?utf-8?B?Y0NQVFhUSGR3cDVtbDNZSTFIY3AzUU9FRmM1TWY4dnVDSERORlhyR0RxN0hq?=
 =?utf-8?B?cG5rT3p5VFdzOTRwY3ZmOHp5Tk1ubi9NT2V4MW44SVBpdk1JRUFiRjFSQnRM?=
 =?utf-8?B?MWdnVnE3VXlsaUFiMTJpclZvekpBTEg2STI3R0hUbDEzSC9lSFU0Q21BQkIw?=
 =?utf-8?B?emsyZ1VFbzU3ZE0yUUhXNElQeTRCMG1TYkpWNU4ra21nTjJPbm1ieWFHUjhw?=
 =?utf-8?B?ZjBubVFNZ0JQcGhZSXlJRTczVDhYOHVpcjVuVjNlUGJGQ2xHcXBHL2w0WUxl?=
 =?utf-8?B?bitGU2tPTDhwaERoOXBIeUJvbVM2eTc0ZTlVVEFFN0hBMXJNZHJwT0ZJcWhy?=
 =?utf-8?B?UHdoYWpyQ3liSGRJTGx0cTdrdHp3cG9jSWE2Z1pVMzY5QVJpejhMdFNFekkz?=
 =?utf-8?B?c3Y5TmlnYlVMMTFsOHBQSVI0cW9ZSHZDT1A2Uk5pMDVDdTRoTHhqemRSaEFx?=
 =?utf-8?B?eStndDlnMjJlQVBNNjJXdHNVazBiaGpHMS9aRHp1Z2V2cU0yTUVIOGhNRnk1?=
 =?utf-8?B?WVJ4dEZMVnBzSzFDTWZhUzM2cnF3V3hydVdLUW1rRTUvaVJkUTlRaDZKOE5J?=
 =?utf-8?B?VTd6WlI1QmlNMUYycnpIRjZCTTl2VTUvSzdUd21RSkk0SE5WWWw2VG5lNWky?=
 =?utf-8?B?ZytBT2t2SWZhbS94alpwMXFqRlk4cXhyUExlTGNMaERTcDliTlRCMnF4SkZQ?=
 =?utf-8?B?UjBUeXlrcG1Pb1orMnl0TUQrbEFkbXZDMmJWZVM0R2dRVGVjRTV3cXBQMGY0?=
 =?utf-8?B?WlZxdlFpRVdtUzJWTVA1VmwwbUxBR1B5VWMybkpRNEJqZjJZREpUUkJQSFdh?=
 =?utf-8?B?VVRWdWM3RFhEK2p6RmVEanBVWm5ITitFcEhlQTFTN25TaUJyb1dLYUtoN002?=
 =?utf-8?B?RmpuelVyYlJJbllLTll2ZkxLMDFkR2VDOUlRdDlyWkp5TW5Kc2Ftd3o1Ri9y?=
 =?utf-8?B?RXlndXlId3JnWHc3NXY2Wm9lbzhXSmk1dHZBMlZLVmNQUi9oZlRmTTUva2tE?=
 =?utf-8?B?eXFmWUlsa0hTOHo0V1pMbFVrS283YURpRzRSQWRNU2tBUkdjQzJkZU9kRUxr?=
 =?utf-8?B?N2dzRU9rTkFBell2YWduaEFOM21hYmM2Yk1tZ05zb3RZQmk4cXRrNWpOd2lS?=
 =?utf-8?B?NHdxaFh6MHBFblI4elF5NGdkcHpiVGZSR1JJZ2dLK0RVTDhySzR5K0l6cjM5?=
 =?utf-8?B?ZU9iSlhvcmdETzBHcGZ2S1ZGcXppSDc1alVUR3Q5VDRrMjNYWUVGNWpIUnFZ?=
 =?utf-8?B?ZTF1RzdsTXdpR1U5NHN5Z1VVcE52Q3J4ZDJQekxpNitnNUxjbEg2V0tuTXV1?=
 =?utf-8?B?Z2ZZcUhpWDl0SmUyY0QwMm1FZmJyQzUwOURlSUJ6ZDB1WlhET3JFbG9WZVYy?=
 =?utf-8?B?TDliSThGZFJrbWlhZ3VoK3lpSkhFVUt1YnhNYXAzcTVwdml4QTlOQjQwV3dp?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D41967B3342BD94CA4AFBFD9C4B245E7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?dnVHSU9Bd0ovQnlITFp5akhVVml4NHh2MUlhekllRmRsVTNkRHNZN09EeTgr?=
 =?utf-8?B?a2Q1NGZBdGowL1pLamhBTG9leGZ3MWtTdmpyRURSa3BkTWJMNmd5cHVPWFRC?=
 =?utf-8?B?aDh0U3Y2UTZkcC84SU0vOE9YeXFHYkFuMUh1VG0xK2U0S3RSajJ3UUxPQnl4?=
 =?utf-8?B?cldUN2pZMkpwRE10UjZCbTNBeDZ4djJkSzZTS0NNU3Jzb3lnSlh5N2FLY09M?=
 =?utf-8?B?V2dRdkd2STVqak5VSW1WT25wbGxYbEJ6M21PTUFFYU5NdHh1WjRhb1h4Mlh3?=
 =?utf-8?B?MVlabjRUYkRLcXhEaHhta2NQcXptcWNvYmZ6L3o0dWY0dGdXL3JMeFczb0R0?=
 =?utf-8?B?WjZxUGNsNVZ2UXZpVjFmSVRsSXNSaEk4NjJ4Nlc0TnpiTE5NZVFkaU9URGhp?=
 =?utf-8?B?K1ZmQ0xPZ3IzYnMvakdSK0pTSmRNU0lVU1NwTkpic21IZ3p5TFRCWHpvNkwx?=
 =?utf-8?B?S0ZtRkNEN2UxTU85c3RqQURVeGhaV1pJWGtoODN2SlZnR0xBRXFDTFNQMXpz?=
 =?utf-8?B?c2pEaUI2UlRydE8xTkZzQ0dkVVplT3FGU3lSb044SmV3YlhaQnMwMlVpaXY2?=
 =?utf-8?B?Rm02eDZlUzdob25BY2o4WTFxbTRMUDZrOUxyVDFSS2g0KzNqb0JiYzZhS29Q?=
 =?utf-8?B?SXE3Y3BXTmlIaXZieTdKdExpdzk5R3lraGM3dC8vYi9GS3Y2RTJFaEJ6SEdh?=
 =?utf-8?B?cnhaWEtDN2FsTDMza3R3d2hBOWJlemR1ZWVaNEJxaHc3OXVIU3EwTi85MkFk?=
 =?utf-8?B?M25SMUpKSUJVUFI1R1F5bDM0Z3FHdi9uQitHREJkZk5pRXJaUWY2Wm5DcXFH?=
 =?utf-8?B?ZlQxOEZXdW5wMFpBbXZEZWxGQU9QZ2hkQkxlNUk2TEZ4czVWMmlWakJBR1JX?=
 =?utf-8?B?ck5TNG96VnF3RUxlTzhBUWJic25aUnlQYTZhRmMzazJoV1dpaCtHTkhQNjA0?=
 =?utf-8?B?M0txZllwMEswek9rM00vNGkvMnRpQzFwWTVzcFQzTHovSm40RU1pZVlQRjNB?=
 =?utf-8?B?U3NHcktzaFpicUlEOGtsSlJwb2hTZHlWT2JpeFFrSTFnR28yTFc5VnF0V0J0?=
 =?utf-8?B?bUFLU3paZzhrVldqRXpWbkFMam5KWUNjZzRXMWhWNHkzbHNNYzBaa3BmMmlF?=
 =?utf-8?B?K1Y2Um1Tb0NYbE1JbUcvY0hLVFNWMmtPYmh5cW1VQkVLaURNZWdva0Q0RXZa?=
 =?utf-8?B?dlBQdHVTZjFwbkwrVThJa3djTmRkQU9IVjE3WFdVTjFKMkdmK1VDdjVSWisw?=
 =?utf-8?B?THJMRzAyUzM4cERjTUF1QUo0dkZIMXpHVnk1dkI4MGxjcTlEQT09?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB4787.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d07170-e0f5-442c-d10e-08db84b95dd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 22:26:28.0664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: moe+HisKUop3wPtp+cvmf0bMyh+RDuGHmblfZlUafTq2AyL70f8Wdvh9tOOgPNUrsL//L6vbj9ehQJUhtVXScw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7384
X-Proofpoint-ORIG-GUID: TbHcIMh65J7l22v8cf1-OOpBLyIUYW8Z
X-Proofpoint-GUID: TbHcIMh65J7l22v8cf1-OOpBLyIUYW8Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_10,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307140205
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gRnJpLCBKdWwgMTQsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBGcm9tOiBMYWRp
c2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IA0KPiBQYXJzZSBhbmQgdmVyaWZ5
IGRldmljZSB0cmVlIG5vZGUgZmlyc3QsIHRoZW4gc2V0dXAgVUNUTCBicmlkZ2UNCj4gdXNpbmcg
dmVyaWZpZWQgdmFsdWVzLiBUaGlzIGF2b2lkcyBoYWxmIGluaXRpYWxpemVkIGhhcmR3YXJlIHN0
YXRlDQo+IGluIGNhc2UgRFQgbWlzY29uZmlndXJhdGlvbiB3YXMgZm91bmQgaW4gdGhlIG1pZGRs
ZSBvZiBzZXR1cC4NCj4gQXMgYSBkd2MzX29jdGVvbl9jbG9ja3Nfc3RhcnQgYWxyZWFkeSBkaWQg
bW9yZSB0aGFuIGp1c3Qgc3RhcnRpbmcNCj4gYSBjbG9jaywgcmVuYW1lIGl0IGFwcHJvcHJpZXRs
eSBhbmQgbW92ZSBhbGwgaGFyZHdhcmUgc2V0dXAgdGhlcmUuDQoNClRoZXJlIGFyZSBtdWx0aXBs
ZSB0aGluZ3MgaGFwcGVuaW5nIGhlcmUgbW9yZSB0aGFuIGp1c3QgbW92aW5nIHRoZSBjb2RlLg0K
Q2FuIHlvdSBzcGxpdCB0aGVtIGludG8gc2VwYXJhdGUgY29tbWl0cz8NCg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogTGFkaXNsYXYgTWljaGwgPGxhZGlzQGxpbnV4LW1pcHMub3JnPg0KPiAtLS0NCj4g
IENIQU5HRVM6DQo+ICAtIHYyOiBpZiBlbHNlIGJsb2NrIGJyYWNrZXQgYWNjb3JkaW5nIENvZGlu
Z1N0eWxlDQo+ICAtIHYzOiBtb3JlIGRlc2NyaXB0aXZlIGNvbW1pdCBtZXNzYWdlLCBwb3dlciBn
cGlvIHBhcnNpbmcgaW4gcHJvYmUgdG9vLA0KPiAgICAgICAgY2hlY2twYXRjaCAtLXN0cmljdCBw
YXNzZWQNCj4gDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMgfCAyMzYgKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTA5IGluc2Vy
dGlvbnMoKyksIDEyNyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9kd2MzL2R3YzMtb2N0ZW9uLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMNCj4g
aW5kZXggNjliYWM2MWNjYmUwLi5kZDQ3NDk4ZjRlZmIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy1vY3Rlb24uYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0
ZW9uLmMNCj4gQEAgLTI1OCwxMDggKzI1OCwxNCBAQCBzdGF0aWMgaW50IGR3YzNfb2N0ZW9uX2dl
dF9kaXZpZGVyKHZvaWQpDQo+ICAJcmV0dXJuIGRpdjsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIGlu
dCBkd2MzX29jdGVvbl9jb25maWdfcG93ZXIoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkIF9faW9t
ZW0gKmJhc2UpDQo+ICtzdGF0aWMgaW50IGR3YzNfb2N0ZW9uX3NldHVwKHZvaWQgX19pb21lbSAq
YmFzZSwNCg0KSSB3b3VsZCBwYXNzIGR3YzNfZGF0YSBoZXJlIGluc3RlYWQgb2YganVzdCB0aGUg
YmFzZS4gSXQgZml0cyB3aXRoIHRoZQ0KZnVuY3Rpb24gbmFtZSwgYW5kIGl0IHJlcXVpcmVzIGxl
c3MgY2hhbmdlIGluIHRoZSBmdXR1cmUgaW4gY2FzZSB5b3UNCm5lZWQgYWNjZXNzIGR3YzNfZGF0
YS4NCg0KPiArCQkJICAgICBpbnQgcmVmX2Nsa19zZWwsIGludCByZWZfY2xrX2ZzZWwsIGludCBt
cGxsX211bCwNCj4gKwkJCSAgICAgaW50IHBvd2VyX2dwaW8sIGludCBwb3dlcl9hY3RpdmVfbG93
KQ0KPiAgew0KPiAtCXVpbnQzMl90IGdwaW9fcHdyWzNdOw0KPiAtCWludCBncGlvLCBsZW4sIHBv
d2VyX2FjdGl2ZV9sb3c7DQo+IC0Jc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gZGV2LT5vZl9u
b2RlOw0KPiAtCXU2NCB2YWw7DQo+IC0Jdm9pZCBfX2lvbWVtICp1Y3RsX2hvc3RfY2ZnX3JlZyA9
IGJhc2UgKyBVU0JEUkRfVUNUTF9IT1NUX0NGRzsNCj4gLQ0KPiAtCWlmIChvZl9maW5kX3Byb3Bl
cnR5KG5vZGUsICJwb3dlciIsICZsZW4pICE9IE5VTEwpIHsNCj4gLQkJaWYgKGxlbiA9PSAxMikg
ew0KPiAtCQkJb2ZfcHJvcGVydHlfcmVhZF91MzJfYXJyYXkobm9kZSwgInBvd2VyIiwgZ3Bpb19w
d3IsIDMpOw0KPiAtCQkJcG93ZXJfYWN0aXZlX2xvdyA9IGdwaW9fcHdyWzJdICYgMHgwMTsNCj4g
LQkJCWdwaW8gPSBncGlvX3B3clsxXTsNCj4gLQkJfSBlbHNlIGlmIChsZW4gPT0gOCkgew0KPiAt
CQkJb2ZfcHJvcGVydHlfcmVhZF91MzJfYXJyYXkobm9kZSwgInBvd2VyIiwgZ3Bpb19wd3IsIDIp
Ow0KPiAtCQkJcG93ZXJfYWN0aXZlX2xvdyA9IDA7DQo+IC0JCQlncGlvID0gZ3Bpb19wd3JbMV07
DQo+IC0JCX0gZWxzZSB7DQo+IC0JCQlkZXZfZXJyKGRldiwgImludmFsaWQgcG93ZXIgY29uZmln
dXJhdGlvblxuIik7DQo+IC0JCQlyZXR1cm4gLUVJTlZBTDsNCj4gLQkJfQ0KPiAtCQlkd2MzX29j
dGVvbl9jb25maWdfZ3BpbygoKHU2NCliYXNlID4+IDI0KSAmIDEsIGdwaW8pOw0KPiAtDQo+IC0J
CS8qIEVuYWJsZSBYSENJIHBvd2VyIGNvbnRyb2wgYW5kIHNldCBpZiBhY3RpdmUgaGlnaCBvciBs
b3cuICovDQo+IC0JCXZhbCA9IGR3YzNfb2N0ZW9uX3JlYWRxKHVjdGxfaG9zdF9jZmdfcmVnKTsN
Cj4gLQkJdmFsIHw9IFVTQkRSRF9VQ1RMX0hPU1RfUFBDX0VOOw0KPiAtCQlpZiAocG93ZXJfYWN0
aXZlX2xvdykNCj4gLQkJCXZhbCAmPSB+VVNCRFJEX1VDVExfSE9TVF9QUENfQUNUSVZFX0hJR0hf
RU47DQo+IC0JCWVsc2UNCj4gLQkJCXZhbCB8PSBVU0JEUkRfVUNUTF9IT1NUX1BQQ19BQ1RJVkVf
SElHSF9FTjsNCj4gLQkJZHdjM19vY3Rlb25fd3JpdGVxKHVjdGxfaG9zdF9jZmdfcmVnLCB2YWwp
Ow0KPiAtCX0gZWxzZSB7DQo+IC0JCS8qIERpc2FibGUgWEhDSSBwb3dlciBjb250cm9sIGFuZCBz
ZXQgaWYgYWN0aXZlIGhpZ2guICovDQo+IC0JCXZhbCA9IGR3YzNfb2N0ZW9uX3JlYWRxKHVjdGxf
aG9zdF9jZmdfcmVnKTsNCj4gLQkJdmFsICY9IH5VU0JEUkRfVUNUTF9IT1NUX1BQQ19FTjsNCj4g
LQkJdmFsICY9IH5VU0JEUkRfVUNUTF9IT1NUX1BQQ19BQ1RJVkVfSElHSF9FTjsNCj4gLQkJZHdj
M19vY3Rlb25fd3JpdGVxKHVjdGxfaG9zdF9jZmdfcmVnLCB2YWwpOw0KPiAtCQlkZXZfaW5mbyhk
ZXYsICJwb3dlciBjb250cm9sIGRpc2FibGVkXG4iKTsNCj4gLQl9DQo+IC0JcmV0dXJuIDA7DQo+
IC19DQo+IC0NCj4gLXN0YXRpYyBpbnQgZHdjM19vY3Rlb25fY2xvY2tzX3N0YXJ0KHN0cnVjdCBk
ZXZpY2UgKmRldiwgdm9pZCBfX2lvbWVtICpiYXNlKQ0KPiAtew0KPiAtCWludCBpLCBkaXYsIG1w
bGxfbXVsLCByZWZfY2xrX2ZzZWwsIHJlZl9jbGtfc2VsID0gMjsNCj4gLQl1MzIgY2xvY2tfcmF0
ZTsNCj4gKwlpbnQgZGl2Ow0KPiAgCXU2NCB2YWw7DQo+ICAJdm9pZCBfX2lvbWVtICp1Y3RsX2N0
bF9yZWcgPSBiYXNlICsgVVNCRFJEX1VDVExfQ1RMOw0KPiAtDQo+IC0JaWYgKGRldi0+b2Zfbm9k
ZSkgew0KPiAtCQljb25zdCBjaGFyICpzc19jbG9ja190eXBlOw0KPiAtCQljb25zdCBjaGFyICpo
c19jbG9ja190eXBlOw0KPiAtDQo+IC0JCWkgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihkZXYtPm9m
X25vZGUsDQo+IC0JCQkJCSAicmVmY2xrLWZyZXF1ZW5jeSIsICZjbG9ja19yYXRlKTsNCj4gLQkJ
aWYgKGkpIHsNCj4gLQkJCWRldl9lcnIoZGV2LCAiTm8gVUNUTCBcInJlZmNsay1mcmVxdWVuY3lc
IlxuIik7DQo+IC0JCQlyZXR1cm4gLUVJTlZBTDsNCj4gLQkJfQ0KPiAtCQlpID0gb2ZfcHJvcGVy
dHlfcmVhZF9zdHJpbmcoZGV2LT5vZl9ub2RlLA0KPiAtCQkJCQkgICAgInJlZmNsay10eXBlLXNz
IiwgJnNzX2Nsb2NrX3R5cGUpOw0KPiAtCQlpZiAoaSkgew0KPiAtCQkJZGV2X2VycihkZXYsICJO
byBVQ1RMIFwicmVmY2xrLXR5cGUtc3NcIlxuIik7DQo+IC0JCQlyZXR1cm4gLUVJTlZBTDsNCj4g
LQkJfQ0KPiAtCQlpID0gb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcoZGV2LT5vZl9ub2RlLA0KPiAt
CQkJCQkgICAgInJlZmNsay10eXBlLWhzIiwgJmhzX2Nsb2NrX3R5cGUpOw0KPiAtCQlpZiAoaSkg
ew0KPiAtCQkJZGV2X2VycihkZXYsICJObyBVQ1RMIFwicmVmY2xrLXR5cGUtaHNcIlxuIik7DQo+
IC0JCQlyZXR1cm4gLUVJTlZBTDsNCj4gLQkJfQ0KPiAtCQlpZiAoc3RyY21wKCJkbG1jX3JlZl9j
bGswIiwgc3NfY2xvY2tfdHlwZSkgPT0gMCkgew0KPiAtCQkJaWYgKHN0cmNtcChoc19jbG9ja190
eXBlLCAiZGxtY19yZWZfY2xrMCIpID09IDApDQo+IC0JCQkJcmVmX2Nsa19zZWwgPSAwOw0KPiAt
CQkJZWxzZSBpZiAoc3RyY21wKGhzX2Nsb2NrX3R5cGUsICJwbGxfcmVmX2NsayIpID09IDApDQo+
IC0JCQkJcmVmX2Nsa19zZWwgPSAyOw0KPiAtCQkJZWxzZQ0KPiAtCQkJCWRldl93YXJuKGRldiwg
IkludmFsaWQgSFMgY2xvY2sgdHlwZSAlcywgdXNpbmcgcGxsX3JlZl9jbGsgaW5zdGVhZFxuIiwN
Cj4gLQkJCQkJIGhzX2Nsb2NrX3R5cGUpOw0KPiAtCQl9IGVsc2UgaWYgKHN0cmNtcChzc19jbG9j
a190eXBlLCAiZGxtY19yZWZfY2xrMSIpID09IDApIHsNCj4gLQkJCWlmIChzdHJjbXAoaHNfY2xv
Y2tfdHlwZSwgImRsbWNfcmVmX2NsazEiKSA9PSAwKQ0KPiAtCQkJCXJlZl9jbGtfc2VsID0gMTsN
Cj4gLQkJCWVsc2UgaWYgKHN0cmNtcChoc19jbG9ja190eXBlLCAicGxsX3JlZl9jbGsiKSA9PSAw
KQ0KPiAtCQkJCXJlZl9jbGtfc2VsID0gMzsNCj4gLQkJCWVsc2Ugew0KPiAtCQkJCWRldl93YXJu
KGRldiwgIkludmFsaWQgSFMgY2xvY2sgdHlwZSAlcywgdXNpbmcgcGxsX3JlZl9jbGsgaW5zdGVh
ZFxuIiwNCj4gLQkJCQkJIGhzX2Nsb2NrX3R5cGUpOw0KPiAtCQkJCXJlZl9jbGtfc2VsID0gMzsN
Cj4gLQkJCX0NCj4gLQkJfSBlbHNlDQo+IC0JCQlkZXZfd2FybihkZXYsICJJbnZhbGlkIFNTIGNs
b2NrIHR5cGUgJXMsIHVzaW5nIGRsbWNfcmVmX2NsazAgaW5zdGVhZFxuIiwNCj4gLQkJCQkgc3Nf
Y2xvY2tfdHlwZSk7DQo+IC0NCj4gLQkJaWYgKChyZWZfY2xrX3NlbCA9PSAwIHx8IHJlZl9jbGtf
c2VsID09IDEpICYmDQo+IC0JCSAgICAoY2xvY2tfcmF0ZSAhPSAxMDAwMDAwMDApKQ0KPiAtCQkJ
ZGV2X3dhcm4oZGV2LCAiSW52YWxpZCBVQ1RMIGNsb2NrIHJhdGUgb2YgJXUsIHVzaW5nIDEwMDAw
MDAwMCBpbnN0ZWFkXG4iLA0KPiAtCQkJCSBjbG9ja19yYXRlKTsNCj4gLQ0KPiAtCX0gZWxzZSB7
DQo+IC0JCWRldl9lcnIoZGV2LCAiTm8gVVNCIFVDVEwgZGV2aWNlIG5vZGVcbiIpOw0KPiAtCQly
ZXR1cm4gLUVJTlZBTDsNCj4gLQl9DQo+ICsJdm9pZCBfX2lvbWVtICp1Y3RsX2hvc3RfY2ZnX3Jl
ZyA9IGJhc2UgKyBVU0JEUkRfVUNUTF9IT1NUX0NGRzsNCj4gIA0KPiAgCS8qDQo+ICAJICogU3Rl
cCAxOiBXYWl0IGZvciBhbGwgdm9sdGFnZXMgdG8gYmUgc3RhYmxlLi4udGhhdCBzdXJlbHkNCj4g
QEAgLTM4OSwxMCArMjk1LDggQEAgc3RhdGljIGludCBkd2MzX29jdGVvbl9jbG9ja3Nfc3RhcnQo
c3RydWN0IGRldmljZSAqZGV2LCB2b2lkIF9faW9tZW0gKmJhc2UpDQo+ICAJZHdjM19vY3Rlb25f
d3JpdGVxKHVjdGxfY3RsX3JlZywgdmFsKTsNCj4gIAl2YWwgPSBkd2MzX29jdGVvbl9yZWFkcSh1
Y3RsX2N0bF9yZWcpOw0KPiAgCWlmICgoZGl2ICE9IEZJRUxEX0dFVChVU0JEUkRfVUNUTF9DVExf
SF9DTEtESVZfU0VMLCB2YWwpKSB8fA0KPiAtCSAgICAoIShGSUVMRF9HRVQoVVNCRFJEX1VDVExf
Q1RMX0hfQ0xLX0VOLCB2YWwpKSkpIHsNCj4gLQkJZGV2X2VycihkZXYsICJkd2MzIGNvbnRyb2xs
ZXIgY2xvY2sgaW5pdCBmYWlsdXJlLlxuIik7DQo+IC0JCQlyZXR1cm4gLUVJTlZBTDsNCj4gLQl9
DQo+ICsJICAgICghKEZJRUxEX0dFVChVU0JEUkRfVUNUTF9DVExfSF9DTEtfRU4sIHZhbCkpKSkN
Cj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICANCj4gIAkvKiBTdGVwIDRjOiBEZWFzc2VydCB0aGUg
Y29udHJvbGxlciBjbG9jayBkaXZpZGVyIHJlc2V0LiAqLw0KPiAgCXZhbCAmPSB+VVNCRFJEX1VD
VExfQ1RMX0hfQ0xLRElWX1JTVDsNCj4gQEAgLTQwNCwyNCArMzA4LDYgQEAgc3RhdGljIGludCBk
d2MzX29jdGVvbl9jbG9ja3Nfc3RhcnQoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkIF9faW9tZW0g
KmJhc2UpDQo+ICAJdmFsICY9IH5VU0JEUkRfVUNUTF9DVExfUkVGX0NMS19TRUw7DQo+ICAJdmFs
IHw9IEZJRUxEX1BSRVAoVVNCRFJEX1VDVExfQ1RMX1JFRl9DTEtfU0VMLCByZWZfY2xrX3NlbCk7
DQo+ICANCj4gLQlyZWZfY2xrX2ZzZWwgPSAweDA3Ow0KPiAtCXN3aXRjaCAoY2xvY2tfcmF0ZSkg
ew0KPiAtCWRlZmF1bHQ6DQo+IC0JCWRldl93YXJuKGRldiwgIkludmFsaWQgcmVmX2NsayAldSwg
dXNpbmcgMTAwMDAwMDAwIGluc3RlYWRcbiIsDQo+IC0JCQkgY2xvY2tfcmF0ZSk7DQo+IC0JCWZh
bGx0aHJvdWdoOw0KPiAtCWNhc2UgMTAwMDAwMDAwOg0KPiAtCQltcGxsX211bCA9IDB4MTk7DQo+
IC0JCWlmIChyZWZfY2xrX3NlbCA8IDIpDQo+IC0JCQlyZWZfY2xrX2ZzZWwgPSAweDI3Ow0KPiAt
CQlicmVhazsNCj4gLQljYXNlIDUwMDAwMDAwOg0KPiAtCQltcGxsX211bCA9IDB4MzI7DQo+IC0J
CWJyZWFrOw0KPiAtCWNhc2UgMTI1MDAwMDAwOg0KPiAtCQltcGxsX211bCA9IDB4Mjg7DQo+IC0J
CWJyZWFrOw0KPiAtCX0NCj4gIAl2YWwgJj0gflVTQkRSRF9VQ1RMX0NUTF9SRUZfQ0xLX0ZTRUw7
DQo+ICAJdmFsIHw9IEZJRUxEX1BSRVAoVVNCRFJEX1VDVExfQ1RMX1JFRl9DTEtfRlNFTCwgcmVm
X2Nsa19mc2VsKTsNCj4gIA0KPiBAQCAtNDUyLDkgKzMzOCwyMSBAQCBzdGF0aWMgaW50IGR3YzNf
b2N0ZW9uX2Nsb2Nrc19zdGFydChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgX19pb21lbSAqYmFz
ZSkNCj4gIAkvKiBTdGVwIDhiOiBXYWl0IDEwIGNvbnRyb2xsZXItY2xvY2sgY3ljbGVzLiAqLw0K
PiAgCXVkZWxheSgxMCk7DQo+ICANCj4gLQkvKiBTdGVvIDhjOiBTZXR1cCBwb3dlci1wb3dlciBj
b250cm9sLiAqLw0KPiAtCWlmIChkd2MzX29jdGVvbl9jb25maWdfcG93ZXIoZGV2LCBiYXNlKSkN
Cj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJLyogU3RlcCA4YzogU2V0dXAgcG93ZXIgY29udHJv
bC4gKi8NCj4gKwl2YWwgPSBkd2MzX29jdGVvbl9yZWFkcSh1Y3RsX2hvc3RfY2ZnX3JlZyk7DQo+
ICsJdmFsIHw9IFVTQkRSRF9VQ1RMX0hPU1RfUFBDX0VOOw0KPiArCWlmIChwb3dlcl9ncGlvIDwg
MCkgew0KDQpUaGlzIGNoZWNrIG1ha2VzIG1vcmUgc2Vuc2UgaWYgeW91IHVzZSBhIG1hY3JvLg0K
KGUuZy4gaWYgKHBvd2VyX2dwaW8gPT0gVU5LTk9XTl9QSU4pIC4uLikNCg0KPiArCQl2YWwgJj0g
flVTQkRSRF9VQ1RMX0hPU1RfUFBDX0VOOw0KPiArCX0gZWxzZSB7DQo+ICsJCXZhbCB8PSBVU0JE
UkRfVUNUTF9IT1NUX1BQQ19FTjsNCj4gKwkJZHdjM19vY3Rlb25fY29uZmlnX2dwaW8oKChfX2Zv
cmNlIHU2NCliYXNlID4+IDI0KSAmIDEsDQo+ICsJCQkJCXBvd2VyX2dwaW8pOw0KPiArCX0NCj4g
KwlpZiAocG93ZXJfYWN0aXZlX2xvdykNCj4gKwkJdmFsICY9IH5VU0JEUkRfVUNUTF9IT1NUX1BQ
Q19BQ1RJVkVfSElHSF9FTjsNCj4gKwllbHNlDQo+ICsJCXZhbCB8PSBVU0JEUkRfVUNUTF9IT1NU
X1BQQ19BQ1RJVkVfSElHSF9FTjsNCj4gKwlkd2MzX29jdGVvbl93cml0ZXEodWN0bF9ob3N0X2Nm
Z19yZWcsIHZhbCk7DQo+ICANCj4gIAkvKiBTdGVwIDhkOiBEZWFzc2VydCBVQUhDIHJlc2V0IHNp
Z25hbC4gKi8NCj4gIAl2YWwgPSBkd2MzX29jdGVvbl9yZWFkcSh1Y3RsX2N0bF9yZWcpOw0KPiBA
QCAtNTA1LDggKzQwMyw4OSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZHdjM19vY3Rlb25fcGh5X3Jl
c2V0KHZvaWQgX19pb21lbSAqYmFzZSkNCj4gIHN0YXRpYyBpbnQgZHdjM19vY3Rlb25fcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gIAlzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSAmcGRldi0+ZGV2Ow0KPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IGRldi0+b2Zf
bm9kZTsNCj4gIAlzdHJ1Y3QgZHdjM19kYXRhICpkYXRhOw0KPiAtCWludCBlcnI7DQo+ICsJaW50
IGVyciwgbGVuLCByZWZfY2xrX3NlbCwgcmVmX2Nsa19mc2VsLCBtcGxsX211bDsNCj4gKwlpbnQg
cG93ZXJfYWN0aXZlX2xvdywgcG93ZXJfZ3BpbzsNCj4gKwl1MzIgY2xvY2tfcmF0ZSwgZ3Bpb19w
d3JbM107DQo+ICsJY29uc3QgY2hhciAqaHNfY2xvY2tfdHlwZSwgKnNzX2Nsb2NrX3R5cGU7DQo+
ICsNCj4gKwlpZiAoIW5vZGUpIHsNCj4gKwkJZGV2X2VycihkZXYsICJObyBVU0IgVUNUTCBkZXZp
Y2Ugbm9kZVxuIik7DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4gKw0KPiArCWlmIChv
Zl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAicmVmY2xrLWZyZXF1ZW5jeSIsICZjbG9ja19yYXRl
KSkgew0KPiArCQlkZXZfZXJyKGRldiwgIk5vIFVDVEwgXCJyZWZjbGstZnJlcXVlbmN5XCJcbiIp
Ow0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsJaWYgKG9mX3Byb3BlcnR5X3JlYWRf
c3RyaW5nKG5vZGUsICJyZWZjbGstdHlwZS1zcyIsICZzc19jbG9ja190eXBlKSkgew0KPiArCQlk
ZXZfZXJyKGRldiwgIk5vIFVDVEwgXCJyZWZjbGstdHlwZS1zc1wiXG4iKTsNCj4gKwkJcmV0dXJu
IC1FSU5WQUw7DQo+ICsJfQ0KPiArCWlmIChvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZyhub2RlLCAi
cmVmY2xrLXR5cGUtaHMiLCAmaHNfY2xvY2tfdHlwZSkpIHsNCj4gKwkJZGV2X2VycihkZXYsICJO
byBVQ1RMIFwicmVmY2xrLXR5cGUtaHNcIlxuIik7DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiAr
CX0NCj4gKw0KPiArCXJlZl9jbGtfc2VsID0gMjsNCj4gKwlpZiAoc3RyY21wKCJkbG1jX3JlZl9j
bGswIiwgc3NfY2xvY2tfdHlwZSkgPT0gMCkgew0KPiArCQlpZiAoc3RyY21wKGhzX2Nsb2NrX3R5
cGUsICJkbG1jX3JlZl9jbGswIikgPT0gMCkNCj4gKwkJCXJlZl9jbGtfc2VsID0gMDsNCj4gKwkJ
ZWxzZSBpZiAoc3RyY21wKGhzX2Nsb2NrX3R5cGUsICJwbGxfcmVmX2NsayIpKQ0KPiArCQkJZGV2
X3dhcm4oZGV2LCAiSW52YWxpZCBIUyBjbG9jayB0eXBlICVzLCB1c2luZyBwbGxfcmVmX2NsayBp
bnN0ZWFkXG4iLA0KPiArCQkJCSBoc19jbG9ja190eXBlKTsNCj4gKwl9IGVsc2UgaWYgKHN0cmNt
cChzc19jbG9ja190eXBlLCAiZGxtY19yZWZfY2xrMSIpID09IDApIHsNCj4gKwkJaWYgKHN0cmNt
cChoc19jbG9ja190eXBlLCAiZGxtY19yZWZfY2xrMSIpID09IDApIHsNCj4gKwkJCXJlZl9jbGtf
c2VsID0gMTsNCj4gKwkJfSBlbHNlIHsNCj4gKwkJCXJlZl9jbGtfc2VsID0gMzsNCj4gKwkJCWlm
IChzdHJjbXAoaHNfY2xvY2tfdHlwZSwgInBsbF9yZWZfY2xrIikpDQo+ICsJCQkJZGV2X3dhcm4o
ZGV2LCAiSW52YWxpZCBIUyBjbG9jayB0eXBlICVzLCB1c2luZyBwbGxfcmVmX2NsayBpbnN0ZWFk
XG4iLA0KPiArCQkJCQkgaHNfY2xvY2tfdHlwZSk7DQo+ICsJCX0NCj4gKwl9IGVsc2Ugew0KPiAr
CQlkZXZfd2FybihkZXYsICJJbnZhbGlkIFNTIGNsb2NrIHR5cGUgJXMsIHVzaW5nIGRsbWNfcmVm
X2NsazAgaW5zdGVhZFxuIiwNCj4gKwkJCSBzc19jbG9ja190eXBlKTsNCj4gKwl9DQo+ICsNCj4g
KwlyZWZfY2xrX2ZzZWwgPSAweDA3Ow0KPiArCXN3aXRjaCAoY2xvY2tfcmF0ZSkgew0KPiArCWRl
ZmF1bHQ6DQo+ICsJCWRldl93YXJuKGRldiwgIkludmFsaWQgcmVmX2NsayAldSwgdXNpbmcgMTAw
MDAwMDAwIGluc3RlYWRcbiIsDQo+ICsJCQkgY2xvY2tfcmF0ZSk7DQo+ICsJCWZhbGx0aHJvdWdo
Ow0KPiArCWNhc2UgMTAwMDAwMDAwOg0KPiArCQltcGxsX211bCA9IDB4MTk7DQo+ICsJCWlmIChy
ZWZfY2xrX3NlbCA8IDIpDQo+ICsJCQlyZWZfY2xrX2ZzZWwgPSAweDI3Ow0KPiArCQlicmVhazsN
Cj4gKwljYXNlIDUwMDAwMDAwOg0KPiArCQltcGxsX211bCA9IDB4MzI7DQo+ICsJCWJyZWFrOw0K
PiArCWNhc2UgMTI1MDAwMDAwOg0KPiArCQltcGxsX211bCA9IDB4Mjg7DQo+ICsJCWJyZWFrOw0K
PiArCX0NCj4gKw0KPiArCWlmIChvZl9maW5kX3Byb3BlcnR5KG5vZGUsICJwb3dlciIsICZsZW4p
KSB7DQo+ICsJCWlmIChsZW4gPT0gMTIpIHsNCj4gKwkJCW9mX3Byb3BlcnR5X3JlYWRfdTMyX2Fy
cmF5KG5vZGUsICJwb3dlciIsIGdwaW9fcHdyLCAzKTsNCj4gKwkJCXBvd2VyX2FjdGl2ZV9sb3cg
PSBncGlvX3B3clsyXSAmIDB4MDE7DQo+ICsJCQlwb3dlcl9ncGlvID0gZ3Bpb19wd3JbMV07DQo+
ICsJCX0gZWxzZSBpZiAobGVuID09IDgpIHsNCj4gKwkJCW9mX3Byb3BlcnR5X3JlYWRfdTMyX2Fy
cmF5KG5vZGUsICJwb3dlciIsIGdwaW9fcHdyLCAyKTsNCj4gKwkJCXBvd2VyX2FjdGl2ZV9sb3cg
PSAwOw0KPiArCQkJcG93ZXJfZ3BpbyA9IGdwaW9fcHdyWzFdOw0KPiArCQl9IGVsc2Ugew0KPiAr
CQkJZGV2X2VycihkZXYsICJpbnZhbGlkIHBvd2VyIGNvbmZpZ3VyYXRpb25cbiIpOw0KPiArCQkJ
cmV0dXJuIC1FSU5WQUw7DQo+ICsJCX0NCj4gKwl9IGVsc2Ugew0KPiArCQlwb3dlcl9ncGlvID0g
LTE7DQoNCllvdSBzaG91bGQgdXNlIGEgbWFjcm8gZm9yIHRoaXMgaW5zdGVhZCBvZiAtMS4gVXNl
IHRoZSBzYW1lIHVuc2lnbmVkDQp0eXBlIGlmIHBvc3NpYmxlLg0KDQo+ICsJCXBvd2VyX2FjdGl2
ZV9sb3cgPSAwOw0KPiArCQlkZXZfaW5mbyhkZXYsICJwb3dlciBjb250cm9sIGRpc2FibGVkXG4i
KTsNCg0KSWYgeW91IGRvIGFueSBjbGVhbnVwIGxhdGVyLCByZWluc3BlY3QgdGhlc2UgZGV2X2lu
Zm8oKS4gSXQgc2VlbXMNCmRldl9kYmcoKSBpcyBtb3JlIGZpdHRpbmcgaGVyZS4NCg0KPiArCX0N
Cj4gIA0KPiAgCWRhdGEgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmRhdGEpLCBHRlBfS0VS
TkVMKTsNCj4gIAlpZiAoIWRhdGEpDQo+IEBAIC01MTYsOSArNDk1LDEyIEBAIHN0YXRpYyBpbnQg
ZHdjM19vY3Rlb25fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlpZiAo
SVNfRVJSKGRhdGEtPmJhc2UpKQ0KPiAgCQlyZXR1cm4gUFRSX0VSUihkYXRhLT5iYXNlKTsNCj4g
IA0KPiAtCWVyciA9IGR3YzNfb2N0ZW9uX2Nsb2Nrc19zdGFydChkZXYsIGRhdGEtPmJhc2UpOw0K
PiAtCWlmIChlcnIpDQo+ICsJZXJyID0gZHdjM19vY3Rlb25fc2V0dXAoZGF0YS0+YmFzZSwgcmVm
X2Nsa19zZWwsIHJlZl9jbGtfZnNlbCwNCj4gKwkJCQltcGxsX211bCwgcG93ZXJfZ3BpbywgcG93
ZXJfYWN0aXZlX2xvdyk7DQo+ICsJaWYgKGVycikgew0KPiArCQlkZXZfZXJyKGRldiwgImNvbnRy
b2xsZXIgaW5pdCBmYWlsdXJlXG4iKTsNCj4gIAkJcmV0dXJuIGVycjsNCj4gKwl9DQo+ICANCj4g
IAlkd2MzX29jdGVvbl9zZXRfZW5kaWFuX21vZGUoZGF0YS0+YmFzZSk7DQo+ICAJZHdjM19vY3Rl
b25fcGh5X3Jlc2V0KGRhdGEtPmJhc2UpOw0KPiAtLSANCj4gMi4zOS4yDQo+IA0KDQpUaGFua3Ms
DQpUaGluaA==

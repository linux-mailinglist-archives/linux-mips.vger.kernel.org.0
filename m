Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FEEB76A53A
	for <lists+linux-mips@lfdr.de>; Tue,  1 Aug 2023 01:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbjGaXyb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 19:54:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjGaXya (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 19:54:30 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CBBDAF;
        Mon, 31 Jul 2023 16:54:29 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36VJpp3o024101;
        Mon, 31 Jul 2023 16:54:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=1WObMgCYmTIvudsdR5jINOCs38Qiw1p6m69EpOW4+6U=;
 b=tlMrbgyvKq3I0wgYmcZrQfs+hYdvLZz6Tumt5BdQQzWjQFvtgmGPz+skLBD19AuWN0LY
 y9blvYgN0fTIM/9D7otuuKwozQOIveZByuu+h5EMhqOUxmwbkBC9DbAPN7JWbBO8m7jH
 jlZCL9WrSjfbyVjTwHQ+0DE9Pp3C7H1/yCDECFyQSbF5PP59vz967hAkydiO0TmXG7gU
 ST1Nq3yr02itazVIBI8HFBOtpJbWX3+XOwJ+Lug8KoPMzkp3wXNwHzYt5v3JUallLZUM
 wcbLSErXVq0lmAO/b2YouEK0x15wSStAXAwob7fZenUNKuqUeelXoaiY5omt34yHLcUD 6g== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3s51psspej-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 31 Jul 2023 16:54:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1690847656; bh=1WObMgCYmTIvudsdR5jINOCs38Qiw1p6m69EpOW4+6U=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=gMOxJJ69xVYlHuBARxz0p7XqpRdtT/UuxNEk3HWmIwcjfaRlF66MHoPkgqttOTFny
         18PeP5KjHhxZE2t6efCM/A5F6gxCcn742LP+MpD9jn/jJhL87iYMJMkAOA3qmwP14N
         8kkEm0HkDTllSgcw6umtJzG9NDdhSdvNUvfpCaxN9Kuop7RqK7xHOk40j6/z/iVRjN
         jHT/DLX3pOESJrlrU1z4+QO9hsb0ufSSgv2eLe6I+AV0dtkD7fdllFiWOEI7HGooWU
         BnqhIbO6Grl0BUC1iCKFG7XrGngNinDgHd/o8eAAlt7VuhQUJoBEySL2mhUseQVCZm
         n0091n5+CGhQA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1515E40123;
        Mon, 31 Jul 2023 23:54:15 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3A9CAA00FC;
        Mon, 31 Jul 2023 23:54:13 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=LpYsqoEK;
        dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 857F440130;
        Mon, 31 Jul 2023 23:54:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ga9jNi/wv9chqgRul/br1KkXkE9+578U8ZWShEDQFuYoYKuXQLVg+ecrSTDEEuuTtsTYx4dx3INUHtHkKpI++v3s1LBPFlcRibbQ50p2N1x3E2gEEz08A+Fdde+nI4HEAtPWyHG7bAJGj857HS8QQtgEtGcfMP+JeZWz7qST4jOvPLwy7qEAJaiRpCJLwr8h51rv94quMz7GA3+prCvWD4hUFbSOSQjlZCTivlBcuuMo3+TLQLa7W1qyJXHEmKZsnViyxihF1wYruMQSWCuueSPgdPbGHKF0/3iKdCv9DWjQxzXdz6J4N02CdVW2xa5pyYv5su2nwvW1B7DHBl3hwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WObMgCYmTIvudsdR5jINOCs38Qiw1p6m69EpOW4+6U=;
 b=UPqrXUbiRHADJedY15OP4+vrdhLLR0WqWaqbslOX2NdS3Fiz4rrlfFtWPj+OYVRtoTESbkBtXb+lTQOjyv4zC67H3YGqe06kb1nl+Civ95ut/jJZC+qvnGTK9XUjyD0MLYnqexhjanBovdzICf5A3uJST/AXwhoxYWMleAjcpDhfzMR+JSC1oz17XO1xeDWChgmjNyK610zqlOryDXNxQfFi65cU9jDloPBRx8CzzU7YNBw74imUV7lB0m5x7W11/jbADGRPWtOx1W2L1tzlCPSb0jT8mTX36Z1tKu19g6e+gSH5cGnBxpz3MSNGtWHatUqGqWiWSkeHGWvVl1v9wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WObMgCYmTIvudsdR5jINOCs38Qiw1p6m69EpOW4+6U=;
 b=LpYsqoEKauZ1IDay8o2AP+KPu6SfrRmG5gRkgEMt+TcMBgLctgeuB3JRyHcTq5Z0O2rR0PrrGgkfeH/0ejcMg/kuQ+ZPbqB3oq/LihiP+PBdynAYAhSoQeDYVMW2EtQGAY8hB7k+ayTL48BHh85+HvFdLodzx25W8uYMVefN3Zs=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DS0PR12MB6415.namprd12.prod.outlook.com (2603:10b6:8:cc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 23:54:04 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::138d:ed63:a424:1f33]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::138d:ed63:a424:1f33%5]) with mapi id 15.20.6631.042; Mon, 31 Jul 2023
 23:54:04 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5 2/7] usb: dwc3: dwc3-octeon: Use _ULL bitfields defines
Thread-Topic: [PATCH v5 2/7] usb: dwc3: dwc3-octeon: Use _ULL bitfields
 defines
Thread-Index: AQHZw5HLcclrtVZ+t0ucGeUkk/dYMq/UjSsA
Date:   Mon, 31 Jul 2023 23:54:04 +0000
Message-ID: <20230731235308.gzxzilwvdju2lcf5@synopsys.com>
References: <ZMd/HzISn0mPsNWt@lenoch> <ZMd/aa2ncz6tJGNU@lenoch>
In-Reply-To: <ZMd/aa2ncz6tJGNU@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DS0PR12MB6415:EE_
x-ms-office365-filtering-correlation-id: 8f18a5ff-e658-45db-7dff-08db92216bcd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7aX0juCEO0UcE5agCiHzxxUbVUIUFCrHrzOkJHVEk5orIllqYgTQdDtTZzFQBAhFnrj7xHgEywm7PQGNo8R5dg2l3nO8/nxsRiO1skLBapnyccrtZ5lsqaqkEOlqBPtg+LARwOKmMol2ilRFPsTshzPP5TNo6z8QnW4dYmIy9a+BQc2T9sgcT68VK2bPnliMD59t4illCxsc8vcxvN4lYVWQGfzOLwGykSLXSs9X1KqDXaP3nBVgJI1Q1bH9dpe946CNCaHq0G5zVVOcdD07IEvUi/lh+cs6yYrmArWqJMCggaTWf475lVUMeIy80uJLpwYFt+8wEAlIyOL2AAMLpL966m+qduxuQGQDJuq2BuXjo6YpoT+B25NDSHa1mtYBv10Vlb4PHqTV7UkESPn9Y8jAeaoTEA/FO3ZPgUsRlPWiXfLgOvZ4dGb80TTIBltZgfBlg6Q1nqcLZv1EXSlEwkmFt2KNzYXP1joBXzJXL84EIddeUa1+2jhHpd5Cxkqw0GA5FVxXu6nHx4d5XdAfFOM+56fxZje6Hlj7u42M4VHxObNwqe28CIhqoghqX5CCWdGmtAqIKs2cTh3ZB2nIDEe2S0E9yapB+lkdi2CQkXo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(36756003)(478600001)(38100700002)(122000001)(86362001)(38070700005)(6512007)(966005)(71200400001)(6486002)(2616005)(186003)(1076003)(26005)(8676002)(8936002)(6506007)(5660300002)(76116006)(4326008)(2906002)(66446008)(66556008)(6916009)(66946007)(64756008)(66476007)(41300700001)(54906003)(316002)(4744005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkFGTUltektkS2ovbDExNHZaVHVkYXRyd3FoWlhHRVJXRUpEUTFkS0REWEMv?=
 =?utf-8?B?Mk41bTZBL2dCdFpVM2k0QXkwd1VKWTlEZWNQYlVTMVhiYTI4Rk9VUks2aGhE?=
 =?utf-8?B?ZlZVNldnbFpScG13MDRDVlB3c0hlWEJKZDNaMUt0NkNNdkpXdTYxRVlVc3Uv?=
 =?utf-8?B?T1pTMDAzalh3Z1RQZ011b0Z5SVQ3bHJhbnJHbFZ5VDZTT1djSk04N2dWNFhk?=
 =?utf-8?B?U2pQTFZiOGxXeVZsbDJWWUFTWVpxRVdyODNOcWkxdEVhMmZNaHVjVG9FczhW?=
 =?utf-8?B?YlhjSDV0bUEzSFNsUmNnUlVsVVRsOFJ5VGx5Q0NOMlVDWHJSQ3lBdzNiNmN0?=
 =?utf-8?B?VHN6bitXK1BTUldwYVlHSEQ1RzY4MmpLVDcyWFJXYWtHNVZPUGNJZnV1a29X?=
 =?utf-8?B?WDVmRzUxK2R6d1J5U0R3bGpVODZwYzBTOWoyU1crRkExM1F6d0ZVczhkNGNU?=
 =?utf-8?B?TTBSbFpuT3ZiV1I0dWJ1TzVtS3RpSlhJYjJaQVh2RnFhM1RucmdMTXJLQkpE?=
 =?utf-8?B?Z0xMaU92NVE3SFU4RXVZTmhKRFV1Zno1bndVcGxybDM1R0FTcGJ1K0YyUm13?=
 =?utf-8?B?NXJXOG9yM2tNK2NENnd6bzZ4M1hhbkJrRnYvVnZuK1NaeVYxSEMwRmh5S2sy?=
 =?utf-8?B?cEhiR0RhRmoyNzYwTWUrQWhubXlJc1JwazFWRDQ2Uk1NRVZzQUpHNnZBWmUr?=
 =?utf-8?B?R1hDKytDYnN2alNVSHM5MElSUjh5dzdaUmJBc1Q5bFdjTWhVeHNacXgxNjRx?=
 =?utf-8?B?QW5LUFFBRm1OY1FYZ2w4S25wcFp1ZWw2dVBBM2N2ODVhNCs2bUJOVmphcUx3?=
 =?utf-8?B?U3oxL0VoYkNQSitRNmo2WCtKd25FYnY5YTNON0ZiTS80VU5PYVVLL0xZakFX?=
 =?utf-8?B?UzhjenpMRDg0MXY1bGtTZWY2MFlBZkhGMzRtTWg3SGRKdzMwSlBDbjMvWC95?=
 =?utf-8?B?ak1CLzQ2c0t0MnNmNXJFTW9XNXEzTnZ2eVFKMkFDMjRReXpvQUZuM0FYRlFm?=
 =?utf-8?B?Z3B4Q2pNeVByUTI5cTlWdjMxZmRaNlBLZ0dhU2VGSkN3dmRoVWpUR0t2VG55?=
 =?utf-8?B?MTQ0WHV4MHpZa0tsanVpVUFuY0w5dmlZLzQ4TjNtbEVjTnRTSFpNNDhTM0gz?=
 =?utf-8?B?MnVnS1IxbjZ3RkpORjFkN0N2MzBENWdVYUhkMTBkNWVGYm4wU2RkbzZVU2px?=
 =?utf-8?B?bzh4enZTdHlJOXV6Vmx0RHRSNlBOU2dUY1dhYkdmZ3VWOHpaTjRHNWlPVnFh?=
 =?utf-8?B?cnE3NTdLbWUxelV3T05oWmt6QU1LZXpManJrc05PSGx6MlFjTnRZRGZQTnBo?=
 =?utf-8?B?V2xtKytCQ1IrRXpGeWFBeUJMQ25yNEJxVXU0a3BMeFhCUUVFOHA1Z25jV3VX?=
 =?utf-8?B?TnlxR0p5RXZkcEx1QUVGTkxXVy9scXRPMWdtWnE5cHA3eUtVMm5qTXRvWmZ2?=
 =?utf-8?B?K0kyTnpVZUZCZ3V1NE5QODZSakh5cy9PVWZsa1YxWnJZMkxZS0k5KzFsb085?=
 =?utf-8?B?bDBkMm83RGVBS1VwMjZvVHZiTCtXdCtBRFVwUUttYkV2bzdWT3pxK2ZYc1Fa?=
 =?utf-8?B?WEpxY2hJVzcyWktGWUFvMUZwT21wbFVXRTBMZWJvUTRYL1AvN0pMcnZCL1JX?=
 =?utf-8?B?bDJGV1B4WEl2VnIzN1hVOUgyYWh6eFczM0ozMzJuMmRpcUQ3bmxsa3BvN1dW?=
 =?utf-8?B?blc3RUZjNnFBMDd5WFEyeEdsaDJVS2FsY0xjYjZ4anEySnR3cWFKY2E5a05h?=
 =?utf-8?B?Z2JJWTJDU1hlbzhmZ1JzMmNHczErbEJjT2U5K2FPWXZKWkRpRlZEelBES3Fv?=
 =?utf-8?B?NmszTm1UaTJZNWszdFZvbWpTOUFhK205WVhjUjFGLy8yVVk1clM2UmE3cTBY?=
 =?utf-8?B?ZTYveVB2VXRCTmpZcXNLaFIrdlNweXk0eDQ2VVR4RnV2dEk5ZHpESVpabW1U?=
 =?utf-8?B?dXBnd1MyN1dQTW5hNHNYUEZXcHRHbE4rTGlSUUdlKzJZWStjRThjNEJmOWZp?=
 =?utf-8?B?M2Y2eTBNaitWY3FxWDdFa0ljYThEdXVLZVB1Vk9LNEdXOGpJRzl3U01IRVVj?=
 =?utf-8?B?b0Y0dzhrckxhV2IveFNHSkdkMWRFcnFQS1Q5MVEyeWFHRWdpUlRWak9HRDQv?=
 =?utf-8?Q?9rqhQGGZwq20w9x564VPiCRzQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47261F0EDA0F0A4891ED064F0C50DC77@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?d2tPbGxmdUxoWTg2Yi9wZ3JyNzBlcjVRUGQ3WDlORW9tWk0yWGdwVmpaTk1P?=
 =?utf-8?B?dTdjSHVyK0l4STk5L05pTWNTTkJMWG52MnVnK2VWaGdPTGorVGRhcU1SYWN1?=
 =?utf-8?B?ZmtkMnpwUW8xZjJpZGUrSXd3Y1J5MTAyRlVHS3V2WE5SSmhKUGhPNnFjOWFa?=
 =?utf-8?B?aUVrV0hIU29ncEtXaExqZ0t5dWxQMHpWNW4wdjc0UWswSHFzZG9COGFmQWpH?=
 =?utf-8?B?QWNRdUkvL3J5a0VJb3VZUHVlV1dQemJ2U0FOYjJuajVDZkdvQmtSazQrR3hZ?=
 =?utf-8?B?Wk8rNk1xVFNnbVZVTlE3eFQ1M1N1SHc2OWVBTFdCM3VhMCtPcFBreDBOU1Jz?=
 =?utf-8?B?cXRPcVdQc3FqdldzYlNCR3dnTHE4aXdIZzYvRzhORjhHSGRHNWdrYzNkNVJY?=
 =?utf-8?B?WWRkVGV4K0FTalc1ajJndnlCc0oycEpYUnVwZ1c0dGFSUWVpbGdPbDVjS2dD?=
 =?utf-8?B?VW1lWGxWaTFHWFVBVWxOWmFSOVhrN1E4cUozMDJ3TmpCTkZrRHd5a1hSQWg1?=
 =?utf-8?B?ZEg5c1QyV2NqUi9ZM3IrTjZ5QkgyZFJsWUZjMnUrVFhwMnlicXV0NHRIekd0?=
 =?utf-8?B?TFl2MXBRSzF1Y3VONUJhQjlmcG1Kb0NCcnVwbHJUUEVoWkhkRlpoeGRrUWxH?=
 =?utf-8?B?WFBwNTBtcWpyVWpQT1RiUkRuS251T1NJSnpuYW1ScS9uSUQ1WmhmMTRGVnMz?=
 =?utf-8?B?WEoyTXl3QUxtZWRyM3Z1ek5pQXJ4T3E3NmhSYjV1Ky9TYnJtZFZIczV1dDB4?=
 =?utf-8?B?ckJ6dFd3dTZmclFNaC9udFNYVXpRblg1cTBVZXJxZlMySG5PZXFWdzA4MnYz?=
 =?utf-8?B?QUpsem82OUNFK0JaRU5sVXpmempoNzhFenZqOTNaOFJVMnVrZ1NRQmF0dFgr?=
 =?utf-8?B?cGhlTS82b1VBdWxha0E1U2g1SWs1ZkNIMXZHaEVjV0FYaDV2czZXRFR2bTd4?=
 =?utf-8?B?bnNLcXFvaFp6YVRibXlVZ01pWkR6UGpndTNZcGhsSVZzbDdKMXRqbzUwbVFn?=
 =?utf-8?B?QjNFMTJaTjRtc0gvMVZNMWJJSFdBVWxpQ0s4bXExVndpWmxuQVhWZ09hSENw?=
 =?utf-8?B?YUVFcnNvcnhzWDV3S0Zxc2hhR3RnYi9xY3FVVnhKVGRkVG9XcjFReUZXVWF6?=
 =?utf-8?B?NUNOUDBuVmo2aHZQbHMvcG44Tm43ZGE4TGdCeU91ejhEWThKWC9RbTVXUk9w?=
 =?utf-8?B?UjFMWXBqOFdldldmOGxxTkwybkFWWkIvWFpjQzNVVXVvM0dOOHZacDNkVk0y?=
 =?utf-8?B?L04yVy8vOU51dXVaY0k1YW5icmxMUFJvbzBvYU5XVW9uZFE1QT09?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f18a5ff-e658-45db-7dff-08db92216bcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 23:54:04.2764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2BVVcZFB/fJ6Dt3bwcCTT51B7iUx2y6P3teDH6dJngDJgigMG0ZpRAnsk0zXzG8ICmTv7dGrKKnKveiXzYS2og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6415
X-Proofpoint-ORIG-GUID: axMohJz3BmWwqobiwpEoLjI6b2_e-uCy
X-Proofpoint-GUID: axMohJz3BmWwqobiwpEoLjI6b2_e-uCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_16,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=445 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307310216
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gTW9uLCBKdWwgMzEsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBGcm9tOiBMYWRp
c2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IA0KPiBXaGlsZSBkcml2ZXIgaXMg
aW50ZW5kZWQgdG8gcnVuIG9uIDY0Yml0IG1hY2hpbmVzLCBpdCBpcyBjb21waWxlIHRpbWUNCj4g
dGVzdGVkIGZvciAzMmJpdCB0YXJnZXRzIGFzIHdlbGwuIEhlcmUgc2hpZnQgY291bnQgb3ZlcmZs
b3cgaXMgcmVwb3J0ZWQNCj4gZm9yIGJpdHMgZ3JlYXRlciB0aGFuIDMxLCBzbyB1c2UgX1VMTCB2
ZXJzaW9ucyBvZiBCSVQgYW5kIEdFTk1BU0sgbWFjcm9zDQo+IHRvIHNpbGVuY2UgdGhlc2Ugd2Fy
bmluZ3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMYWRpc2xhdiBNaWNobCA8bGFkaXNAbGludXgt
bWlwcy5vcmc+DQo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNv
bT4NCj4gQ2xvc2VzOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDIzMDcyNjA1MzcuTVJPcmhWTk0tbGtwQGludGVsLmNv
bS9fXzshIUE0RjJSOUdfcGchYlJBbzdwNDRFUTVhSGNBaUJiVEMtaVlsTzVJeWdLeFpSVjZIUkdv
anNuTkwwcV9JUmQ3VnlPbnVDNVN3dFFCTTJEZ18xTzlORWVFaFN0cTE2RW8xT2NZbTFBJCANCj4g
LS0tDQo+ICBDSEFOR0VTOg0KPiAgLXY1OiBuZXcgcGF0Y2gNCj4gDQo+ICBkcml2ZXJzL3VzYi9k
d2MzL2R3YzMtb2N0ZW9uLmMgfCA3OCArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
DQo+ICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25zKC0pDQo+
IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0K
DQpUaGFua3MsDQpUaGluaA==

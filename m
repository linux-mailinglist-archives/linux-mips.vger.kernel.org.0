Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3636749156
	for <lists+linux-mips@lfdr.de>; Thu,  6 Jul 2023 01:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232095AbjGEXI4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Jul 2023 19:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbjGEXIy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Jul 2023 19:08:54 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94DFAE57;
        Wed,  5 Jul 2023 16:08:53 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365KQ0wd028309;
        Wed, 5 Jul 2023 16:08:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=5Gi76ufKXzExmEDoyKozy/86PktJ4wH35lH8nyNufJM=;
 b=FIBoTZImMVR/l9OXKMNsjknP6OX/i44Z51ZIpVHNsR+oM0y+qIknHz+eO4GffMMLkNvx
 L6xyj4oG+v3+FmKaOsQfJ1DkH70mNAfhGdTjGB4/evtAWmdgfr4IZHW52OWMn4P8JnpY
 Sm90LK23uFeID10WaPuKX1HYi2L1azNCb3FYReObg7NbpmcpZs+LwoC7U/qjZOsn4R6P
 ljY1ldF1bS1uiPCQG0dh44S9ZdCv/uGkai6zRL+G6/SW1ZCVaC62z4aOmbJy56qc8yOF
 IHkJupC5sBLMmaCk+Q0foWmSrVo2g0aFfP9XkeCJNEvrzjgdDDqERkTOXlFFq+aKAK9i vA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3rjkd4g3hx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Jul 2023 16:08:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1688598521; bh=5Gi76ufKXzExmEDoyKozy/86PktJ4wH35lH8nyNufJM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=i3TKnCWfoiYhcQNR7sAuym25VXFp9pPG8rcUiB0CfC1yM/WUaMnKA0isKVNB7D98f
         6uQxwLjIh6Y+OgzF1SIZiSQJg42o9DiHRIZ2dn9gsQ1Mj3SJltLVP/DS6JyDNOMe0p
         fYgSZADLsBuin1rA75ijhNcFNLw7kfdeTe6RmB04NVc7udExQIIHc1Y7EZpRaCrwJw
         USdLcRhkvYHjnbzgqPf+9zbCGOPcygSKopPWuzbMnAZo15kmD/saFqhyLoIdf7nsWx
         NA8QMWcTTMe+wlTS1jjr72A5a+79fzZyJGjiVo1k/YRtRcScuuKI8/UeU2T1VpKMqL
         MQW/vl/Ml136g==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9641E40682;
        Wed,  5 Jul 2023 23:08:40 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id E0098A007A;
        Wed,  5 Jul 2023 23:08:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=QJyIM/ww;
        dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A425040121;
        Wed,  5 Jul 2023 23:08:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iFF2BOLna1GYoqO7gZOR0i4jLAkjgBQQbkITfVI9nBIBJYVyKG4sZKBNoBqORUWmzq2GUZER96D661rDUOnkipwSBqgGQ7FNd8XLMQVxR7799TuH8pLZEpKMdYCAEj731oEP3A3YDii9yb6FEel3MnGBoVbqCdb797a7TbWuuOoKSTnDqPjP/uaNwH1u6aVQdeOOefFXpwQOjmou539yv/nAY8UlfBTCtU6zMwOGSzf0pNt7u9fmrdaRXZGNOpta1XnOXcv12EhwHPhYNLM+JiuDFzbdTLU36NEQQ96ZlqS8HzZgjoB2ZnU4ihz61s+wtL0ruRQHmHot9k1kYUy5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Gi76ufKXzExmEDoyKozy/86PktJ4wH35lH8nyNufJM=;
 b=N6qEsGDqV0nIAj+D0fscdGfKyyrfZ0PcenFyoaY+ZJdcwqhmrj+/2Df1W0PXZIEZsIpLV6kGuziSLDW9MoFnXGRdDL07lgUQKCd8dX9uukRpEjk9QdqMSx7fQamwyPLsJ+/6blXxmPjQ6ljnYDofNPF4UbSR87HS/69ALUQJxj+YV13DSLfSwiuqT7LTaT8cCFh79/TSLJBk1pykjPHzcC2OOCOlQc39imR9ysn/N5UeJE/dlyVKTa/2upR7AR5UUm3LAlRWi0zUsok4JZYXkMGiMU8Im736LJjBEPlEemvQNM9HB9/6i1ZywWA0p8ZxU2HXz5f1413OmKlO/BS5Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Gi76ufKXzExmEDoyKozy/86PktJ4wH35lH8nyNufJM=;
 b=QJyIM/wwVKBdqfYnDsLzMxYMQmAZEvg/aZ8QBuB1pVWLdVpS2KQpqm56UiCjr2Z6BFluaLR9Z5iE4DwBVqBUXKjBEYKqHL9C8Lc20tLtRMUOJ2Edl2U5eVJWFWCr92R3q3IMHG5Eav31NwnjOiVdu3O1ZnVLia1d7PHoYUYBN6U=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by IA1PR12MB6018.namprd12.prod.outlook.com (2603:10b6:208:3d6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 23:08:31 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b%3]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 23:08:31 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] usb: dwc3: dwc3-octeon: Move node parsing into
 driver probe
Thread-Topic: [PATCH v2 2/3] usb: dwc3: dwc3-octeon: Move node parsing into
 driver probe
Thread-Index: AQHZrHqISVNAK1oWA0KLciAtaDdRD6+r0kCA
Date:   Wed, 5 Jul 2023 23:08:31 +0000
Message-ID: <20230705230827.ckzaryaaz73sjrqb@synopsys.com>
References: <ZKDBiY6TKdDKIFK+@lenoch> <ZKDB+d49HVfoZDdd@lenoch>
In-Reply-To: <ZKDB+d49HVfoZDdd@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|IA1PR12MB6018:EE_
x-ms-office365-filtering-correlation-id: b021a53f-fa02-4aa5-2e02-08db7dacc042
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D7MwupelWIok3JkE3D7mFhNl1a677MDz5dBlzut3ybgP21S/qh7mz2mGpaWMW4TictvUwQU0UAApfzZ8AzMqeRuoTEOuOX+P+vDfajKCW638Hd3gd5UZUPSeMpvbkU9qSBgHuvusXr/EKxrwvkPuffB8aq+hJra6zdbzcRE8A3KR3uzR1N164pMQi9DRGmd0HnKMQTMEjL2Pg7OrgMPhb2bsmhJFQEE6agIDD5A3/u4UGs15W0yMeoOIpibViNuUEfDkxyq971qOS556bqts2zvmGDlVIWr5m+TsPMGOkKsM8jjpXFt4jmQSQkH/kCdCqCa46iVYbKCR8vgU5Tyzb+McuKO3CHR2Gvt8HllXub9JSo1PGJXwKK9DWVpzXdnhNswTiI3++KGVnKHXU+n2tvzgSRsYOxrfn3waYe92bMLJXyOt6yadllv8JUOE7VQWQydMNN2y9+i0Bn1CaFyBFqU5PHkA6makLDRi2FOxs15fp/C+D7dt2Fgs/4eAoylUzFhdY2jIBEYgZznnakUIjLCzEfk4PfOHGLjz+tmGjetyhf2V6QCigEa67SCP1jZqf79H+flquoub5HNYcrY/CN/QZyt3O9A4E6zeuK8blqEgVkhyxc0Hxcf85o3it/WA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199021)(478600001)(71200400001)(6486002)(91956017)(76116006)(54906003)(6506007)(26005)(186003)(1076003)(66946007)(6512007)(2906002)(66556008)(66446008)(64756008)(41300700001)(66476007)(316002)(6916009)(5660300002)(4326008)(8936002)(8676002)(122000001)(38100700002)(38070700005)(36756003)(83380400001)(2616005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXN3SUEza2d3R1E2eU9jR2JDcXJaSDMyZUcxY0dzbExlZHZKMDhPUEFtbTln?=
 =?utf-8?B?MU9SQmFVLytTc2oyV3dhYUhWQ0VmZE1wOGlEbFZSOU5DcEUvMW9DVWVFVmpM?=
 =?utf-8?B?bEZEaExNa29jd2tXSW9HSEFIemFYcnRtQmhod2o1WnJ6cnA5R1ZlNWtvL0d6?=
 =?utf-8?B?QVR3S3dMaHJOTFQ5RVcyTjcrNFJ4TlBGT3NPbFBtcTJJYU1heVJCaG4xajdn?=
 =?utf-8?B?S0hIK1hRTldRcndacFVWeFRLY3NHaHpHVDF0SDNrY2t1MjZFVnU0aUJQL2hT?=
 =?utf-8?B?UEJlVGFCVWhBN01UQ2szRmQweHUwVllJR3ZjQXBMVGVSdGZxOHVMejFOYnJq?=
 =?utf-8?B?SmFTTnlxZUd2MnJESjY2V0N1M2RhMTNxS2xNUDFnK1gwbmIxVmw3TlNOVWRq?=
 =?utf-8?B?V3FlYjRJYldkbzVpTGxOejR0RVlna3d2VndUWFlzeVBEZGZEUWs3RnlXY2Rt?=
 =?utf-8?B?cnFhUTYzUnNXR0x0ZzNNc2xuN0s2Q0IrVDUrZnh2and5a2VjMzlBRnZZam5T?=
 =?utf-8?B?YXltbVZ4cFR2UkJybm5jdUtqWUhYYWFiZFl2MlVBdlJXdE83Ri9WSlZrQUZO?=
 =?utf-8?B?QXdURnQwQ0c0Yi85VzZ4QTMzY0FudzlybzRxSnVMR2pvc3I5SlJJNlVQV2Ft?=
 =?utf-8?B?ZmpkS0x1ZjFXZ1BqdEJVUEtTQzV5ZUdvaXozM28yazBKOGN5RGhaZi81dW8v?=
 =?utf-8?B?TWV0OHJ2N2I4VFRoTlpSTDVuY1IyWnFLRjZiaGxhWU8zOE5FeTlRQ3Rtdm11?=
 =?utf-8?B?Tmhwc3BJYzVYNjJyekd2RVo0ZnVEWEFIeEl5YlJoZTk2aWFDdm44cTUwazYw?=
 =?utf-8?B?eDdvN3ZRR0hnTWRhdUVqTmN1ejhqUTdWMDU5Qm1sMkx5WFU4TGJ1d0FHOU11?=
 =?utf-8?B?ZlJKdExCT0poUmlidkFjM296UDNFYy9naUFYdDJpeTkrNzhpRTFQbTZKbjlq?=
 =?utf-8?B?SkJWblhMTVJtdVJLNDNVeVorRXkreXFZZ3lsZkpXblBydEltOEQ1dm9NTnpP?=
 =?utf-8?B?aXZkVThQWVlQRzFTRHd4VDZ1RXNiRWNPU01Yb0YzRDkzanpFNHlKU0JMMVVa?=
 =?utf-8?B?djlUTkU1SVptcG1EYit0amgrQmRLOFBnZ2FEaDhRRzU1K2NOSDJVengzdGRK?=
 =?utf-8?B?andaQzMrWDMvSWttUGUvL095YWVPNk9SRXlGR2lIOVJudVpCQmZ1OTc3VkQx?=
 =?utf-8?B?dXppZGYvTlRwbVp1TnFXNUMyK09ja1p0b1d6OFRmbk4rclJ1NU1PRDNaVk42?=
 =?utf-8?B?VEt1S0dTNTVWWmpFVTRSdnFxUG5wb3hOdXFkcVF5STRlVUVPcXNsKzVSdUxH?=
 =?utf-8?B?eXAzNmZ1OURhWW03dkZ5MDhYZS9HM09CNWt1bC9mVlRQNFRXVHpBQ0hmVytX?=
 =?utf-8?B?bDNDLzljUUFRZmk4OE1tUnY3V0xjWkVwUnRWbDVENEdiOGliRHlaalE5dWpE?=
 =?utf-8?B?eUpjdElBUDdLRlp5bWFpWVV4LzZGU09TaVZtOHNTUFVIRzdpQ056QjR5eVBt?=
 =?utf-8?B?bURacXQvK1N0SWxicTNMV29xTXFRVlNPMWRaUnhLMWV0VVJTUmJCZlZQb2VM?=
 =?utf-8?B?aTVGTW1kQ1g2d3dmTDAvTk5mdzhza2xPUU5FS1pkbXBlR3JzWDkreUF1cGNF?=
 =?utf-8?B?UG9JeVgxMklsQkpIVW5taGJhcXJISlFQV0RmR0R3MkMvWEhkSEhQaVFiWWVV?=
 =?utf-8?B?NG9pZGg2WFJGQVZSdHVVU05aTVA1SklGampKSnpyZ0l0QnQvMHN5dWl2cEtX?=
 =?utf-8?B?VkZnTENoRlpIVFV6OWdXQVRIRHBxREsvRE56K3BwM09QU2FYbTJiVW1nNU5W?=
 =?utf-8?B?dmswaUtSVCtwVDdqZGw0VDlaWlBzOE5zN1pCV0EwMzk2UlRkTnU2cXlmTVJT?=
 =?utf-8?B?aEhPZmVqcnNNZ0VJWjdtWEhzQkxqMGZ2R3I2UTVPdEUvdjhyYjQ2WU14bDds?=
 =?utf-8?B?SmZpMmxxUWgrUG43Q251b280U3VUd3hSNzNtQzVycWpPN1V3d1l4MzNnZzhS?=
 =?utf-8?B?d0w0WmtmVkwra0M2ZkhCcm5NN241WUl2eG9FbEl1eFN6WnA5UVpJT0xsRzIz?=
 =?utf-8?B?NHEzc1pkUkd5Ukk4b0VzdUpCN1lsYjRzZ3BabFdqaGVYaDdTV3VtNU9WbTlr?=
 =?utf-8?Q?swBCS/OxaRO3rb3z//4+3Isa7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <860D65FE7D0F2640818E61A834C7658A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?bWhtdVlOM0dvNjdVdERqdnhHYVZ2MjY3YXdxRURLVldwM3dON1Q3MzhkRWg1?=
 =?utf-8?B?dUpCSFpvMnlxRHoxdmdQampDZzBrWkd0YndJVHlwV3N3dkppZG9CREhua1Nu?=
 =?utf-8?B?S1lyT2JnSVVCbG5uS0ZlZGJrWTRWTFhQbmdCUURLbzRlMnE5TFFhTHF0dGNn?=
 =?utf-8?B?M1FUd3Z3cFM0N3B2Rjh2S2EyREkybFd1bnE1cU1LQzFROGc0NjBIcXNLZ2la?=
 =?utf-8?B?ZWp4M1B4R3lUUkp6ZG9CQ1BIcmNsS0NTbisrUVRLaDFjUW85cnhJY1NPbmxT?=
 =?utf-8?B?MGtEQjFNRVBvNmdpNVJBY0l4Ui9SNGlSbitramt5cmlLYlhLSVU4UFNQMXJi?=
 =?utf-8?B?TXRibXZCeW1uVHFhdG4weGZqNFluV0ZrN1JrcytkNFg4M2duQmNoZGxhYXhO?=
 =?utf-8?B?c25wM1V4ZDE3YkhTZTRvWjUwSWkwR2pITE9BckoxcTV3cUh3ZUNvUFNTQ2xy?=
 =?utf-8?B?TTYzVWg2OVpNSzFtOTFiNFU3NTNZUmNDSmhiUnd6K05xQkRWT3BQMEk5QU5q?=
 =?utf-8?B?RnVaNXVJYncyc2x1amtpL01jR1BtZjFETUg1UDI2YUNwZEM1SU5zc2k4eGRB?=
 =?utf-8?B?TlhFK1hybDVrbmoySEhLalpkS1RTOU5SQUdzbUtKTEJqdWQwSjd3c0NxcjlB?=
 =?utf-8?B?dU9QZDdpbXh3R201Y2NvOXhDK0tpUE1tK2JCQWQvY2NyRnBaajNSeHE5eklZ?=
 =?utf-8?B?cEF6WEhBeTZUUHlaZVRNY3dFWUx4ejdYRjgxdVEvNUVQUjc3dmhydG5BYldz?=
 =?utf-8?B?VHBmME55QjJPbHBTeWtRbHJvczZveXR2MVBTdEkyR2I3OWZBempJNFY3R0x6?=
 =?utf-8?B?aUt2OW5rSXJrc1dQaVlTWFB5NjJFa0IvNTVBNFp0UkdnaSthdWRYcW1aQ0R5?=
 =?utf-8?B?emRaWEdNRGJJS0VFYnJiTTZOWTlCNUV6T1A1dHJGWHNYa3pLeGhiTUYzTzRK?=
 =?utf-8?B?WGtjeWQzNXZ6QUVnNXlIUisxN0hKYzN1Zit4LzdISUt5azB1QUZudlBMRG9r?=
 =?utf-8?B?S1lKTzdCeUR3VzhyQktuaFhqb09SOXVOKzY2ZjhMYTdtRGRvaFcwSW9WQjlY?=
 =?utf-8?B?RXRGa0xmQUtBRHBpVTN4RmUvdExVblNYbWxYYi85WDJqcHp4WkxXNlJJNHlP?=
 =?utf-8?B?bUE5K0YyK05jSS8wZTFaNDA0N29HSHhiYy9xRUhMb3prNVhIcG1zdUc1SEIw?=
 =?utf-8?B?cGdPZWVIcUQzalJrbW5NcTd2SVl1bEtRU2svVEUvTUcwS3gyTVFMYVdDaTRB?=
 =?utf-8?Q?bac66zsCAZKzXlC?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b021a53f-fa02-4aa5-2e02-08db7dacc042
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2023 23:08:31.6078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kCV6T17dddA5SfRxNUljUONxPVnh7qdraH6FpN6oQbvCO2IFctNnv4Re1rs9k/PRvSxv1QUIx/cAwPsqiPZ8Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6018
X-Proofpoint-GUID: UZTW3cw1APVHO-VW22GRgs9knIYSlUqG
X-Proofpoint-ORIG-GUID: UZTW3cw1APVHO-VW22GRgs9knIYSlUqG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_11,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2307050209
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
c2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IA0KPiBNYWtlIGR3YzNfb2N0ZW9u
X2Nsb2Nrc19zdGFydCBqdXN0IHN0YXJ0IHRoZSBjbG9ja3MuDQoNClRoaXMgY29tbWl0IG1lc3Nh
Z2UgaXMgZGlmZmVyZW50IHRoYW4gdGhlIHN1YmplY3QuIEFsc28sIHBsZWFzZSBleHBsYWluDQp3
aHkgd2UgbmVlZCB0byBtb3ZlIHRoaXMgbG9naWMgdG8gcHJvYmUgaW4gdGhpcyBjb21taXQgbWVz
c2FnZSBib2R5Lg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMYWRpc2xhdiBNaWNobCA8bGFkaXNA
bGludXgtbWlwcy5vcmc+DQo+IC0tLQ0KPiAgQ0hBTkdFUzoNCj4gIC12MjogaWYgZWxzZSBibG9j
ayBicmFja2V0IGFjY29yZGluZyBDb2RpbmdTdHlsZQ0KPiAgDQo+ICBkcml2ZXJzL3VzYi9kd2Mz
L2R3YzMtb2N0ZW9uLmMgfCAxNDggKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgNzEgaW5zZXJ0aW9ucygrKSwgNzcgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9jdGVvbi5jIGIvZHJpdmVycy91
c2IvZHdjMy9kd2MzLW9jdGVvbi5jDQo+IGluZGV4IDhkNWZhY2Q4ODFjMS4uNjY4ZjZkMzQ5MGIx
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMNCj4gKysrIGIv
ZHJpdmVycy91c2IvZHdjMy9kd2MzLW9jdGVvbi5jDQo+IEBAIC0zMDAsNjcgKzMwMCwxNCBAQCBz
dGF0aWMgaW50IGR3YzNfb2N0ZW9uX2NvbmZpZ19wb3dlcihzdHJ1Y3QgZGV2aWNlICpkZXYsIHZv
aWQgX19pb21lbSAqYmFzZSkNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIGlu
dCBkd2MzX29jdGVvbl9jbG9ja3Nfc3RhcnQoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkIF9faW9t
ZW0gKmJhc2UpDQo+ICtzdGF0aWMgaW50IGR3YzNfb2N0ZW9uX2Nsb2Nrc19zdGFydChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHZvaWQgX19pb21lbSAqYmFzZSwNCj4gKwkJCQkgICAgaW50IHJlZl9jbGtf
c2VsLCBpbnQgcmVmX2Nsa19mc2VsLA0KPiArCQkJCSAgICBpbnQgbXBsbF9tdWwpDQo+ICB7DQo+
IC0JaW50IGksIGRpdiwgbXBsbF9tdWwsIHJlZl9jbGtfZnNlbCwgcmVmX2Nsa19zZWwgPSAyOw0K
PiAtCXUzMiBjbG9ja19yYXRlOw0KPiArCWludCBkaXY7DQo+ICAJdTY0IHZhbDsNCj4gIAl2b2lk
IF9faW9tZW0gKnVjdGxfY3RsX3JlZyA9IGJhc2UgKyBVU0JEUkRfVUNUTF9DVEw7DQo+ICANCj4g
LQlpZiAoZGV2LT5vZl9ub2RlKSB7DQo+IC0JCWNvbnN0IGNoYXIgKnNzX2Nsb2NrX3R5cGU7DQo+
IC0JCWNvbnN0IGNoYXIgKmhzX2Nsb2NrX3R5cGU7DQo+IC0NCj4gLQkJaSA9IG9mX3Byb3BlcnR5
X3JlYWRfdTMyKGRldi0+b2Zfbm9kZSwNCj4gLQkJCQkJICJyZWZjbGstZnJlcXVlbmN5IiwgJmNs
b2NrX3JhdGUpOw0KPiAtCQlpZiAoaSkgew0KPiAtCQkJZGV2X2VycihkZXYsICJObyBVQ1RMIFwi
cmVmY2xrLWZyZXF1ZW5jeVwiXG4iKTsNCj4gLQkJCXJldHVybiAtRUlOVkFMOw0KPiAtCQl9DQo+
IC0JCWkgPSBvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZyhkZXYtPm9mX25vZGUsDQo+IC0JCQkJCSAg
ICAicmVmY2xrLXR5cGUtc3MiLCAmc3NfY2xvY2tfdHlwZSk7DQo+IC0JCWlmIChpKSB7DQo+IC0J
CQlkZXZfZXJyKGRldiwgIk5vIFVDVEwgXCJyZWZjbGstdHlwZS1zc1wiXG4iKTsNCj4gLQkJCXJl
dHVybiAtRUlOVkFMOw0KPiAtCQl9DQo+IC0JCWkgPSBvZl9wcm9wZXJ0eV9yZWFkX3N0cmluZyhk
ZXYtPm9mX25vZGUsDQo+IC0JCQkJCSAgICAicmVmY2xrLXR5cGUtaHMiLCAmaHNfY2xvY2tfdHlw
ZSk7DQo+IC0JCWlmIChpKSB7DQo+IC0JCQlkZXZfZXJyKGRldiwgIk5vIFVDVEwgXCJyZWZjbGst
dHlwZS1oc1wiXG4iKTsNCj4gLQkJCXJldHVybiAtRUlOVkFMOw0KPiAtCQl9DQo+IC0JCWlmIChz
dHJjbXAoImRsbWNfcmVmX2NsazAiLCBzc19jbG9ja190eXBlKSA9PSAwKSB7DQo+IC0JCQlpZiAo
c3RyY21wKGhzX2Nsb2NrX3R5cGUsICJkbG1jX3JlZl9jbGswIikgPT0gMCkNCj4gLQkJCQlyZWZf
Y2xrX3NlbCA9IDA7DQo+IC0JCQllbHNlIGlmIChzdHJjbXAoaHNfY2xvY2tfdHlwZSwgInBsbF9y
ZWZfY2xrIikgPT0gMCkNCj4gLQkJCQlyZWZfY2xrX3NlbCA9IDI7DQo+IC0JCQllbHNlDQo+IC0J
CQkJZGV2X3dhcm4oZGV2LCAiSW52YWxpZCBIUyBjbG9jayB0eXBlICVzLCB1c2luZyBwbGxfcmVm
X2NsayBpbnN0ZWFkXG4iLA0KPiAtCQkJCQkgaHNfY2xvY2tfdHlwZSk7DQo+IC0JCX0gZWxzZSBp
ZiAoc3RyY21wKHNzX2Nsb2NrX3R5cGUsICJkbG1jX3JlZl9jbGsxIikgPT0gMCkgew0KPiAtCQkJ
aWYgKHN0cmNtcChoc19jbG9ja190eXBlLCAiZGxtY19yZWZfY2xrMSIpID09IDApDQo+IC0JCQkJ
cmVmX2Nsa19zZWwgPSAxOw0KPiAtCQkJZWxzZSBpZiAoc3RyY21wKGhzX2Nsb2NrX3R5cGUsICJw
bGxfcmVmX2NsayIpID09IDApDQo+IC0JCQkJcmVmX2Nsa19zZWwgPSAzOw0KPiAtCQkJZWxzZSB7
DQo+IC0JCQkJZGV2X3dhcm4oZGV2LCAiSW52YWxpZCBIUyBjbG9jayB0eXBlICVzLCB1c2luZyBw
bGxfcmVmX2NsayBpbnN0ZWFkXG4iLA0KPiAtCQkJCQkgaHNfY2xvY2tfdHlwZSk7DQo+IC0JCQkJ
cmVmX2Nsa19zZWwgPSAzOw0KPiAtCQkJfQ0KPiAtCQl9IGVsc2UNCj4gLQkJCWRldl93YXJuKGRl
diwgIkludmFsaWQgU1MgY2xvY2sgdHlwZSAlcywgdXNpbmcgZGxtY19yZWZfY2xrMCBpbnN0ZWFk
XG4iLA0KPiAtCQkJCSBzc19jbG9ja190eXBlKTsNCj4gLQ0KPiAtCQlpZiAoKHJlZl9jbGtfc2Vs
ID09IDAgfHwgcmVmX2Nsa19zZWwgPT0gMSkgJiYNCj4gLQkJICAgIChjbG9ja19yYXRlICE9IDEw
MDAwMDAwMCkpDQo+IC0JCQlkZXZfd2FybihkZXYsICJJbnZhbGlkIFVDVEwgY2xvY2sgcmF0ZSBv
ZiAldSwgdXNpbmcgMTAwMDAwMDAwIGluc3RlYWRcbiIsDQo+IC0JCQkJIGNsb2NrX3JhdGUpOw0K
PiAtDQo+IC0JfSBlbHNlIHsNCj4gLQkJZGV2X2VycihkZXYsICJObyBVU0IgVUNUTCBkZXZpY2Ug
bm9kZVxuIik7DQo+IC0JCXJldHVybiAtRUlOVkFMOw0KPiAtCX0NCj4gLQ0KPiAgCS8qDQo+ICAJ
ICogU3RlcCAxOiBXYWl0IGZvciBhbGwgdm9sdGFnZXMgdG8gYmUgc3RhYmxlLi4udGhhdCBzdXJl
bHkNCj4gIAkgKiAgICAgICAgIGhhcHBlbmVkIGJlZm9yZSBzdGFydGluZyB0aGUga2VybmVsLiBT
S0lQDQo+IEBAIC00MDQsMjQgKzM1MSw2IEBAIHN0YXRpYyBpbnQgZHdjM19vY3Rlb25fY2xvY2tz
X3N0YXJ0KHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCBfX2lvbWVtICpiYXNlKQ0KPiAgCXZhbCAm
PSB+VVNCRFJEX1VDVExfQ1RMX1JFRl9DTEtfU0VMOw0KPiAgCXZhbCB8PSBGSUVMRF9QUkVQKFVT
QkRSRF9VQ1RMX0NUTF9SRUZfQ0xLX1NFTCwgcmVmX2Nsa19zZWwpOw0KPiAgDQo+IC0JcmVmX2Ns
a19mc2VsID0gMHgwNzsNCj4gLQlzd2l0Y2ggKGNsb2NrX3JhdGUpIHsNCj4gLQlkZWZhdWx0Og0K
PiAtCQlkZXZfd2FybihkZXYsICJJbnZhbGlkIHJlZl9jbGsgJXUsIHVzaW5nIDEwMDAwMDAwMCBp
bnN0ZWFkXG4iLA0KPiAtCQkJIGNsb2NrX3JhdGUpOw0KPiAtCQlmYWxsdGhyb3VnaDsNCj4gLQlj
YXNlIDEwMDAwMDAwMDoNCj4gLQkJbXBsbF9tdWwgPSAweDE5Ow0KPiAtCQlpZiAocmVmX2Nsa19z
ZWwgPCAyKQ0KPiAtCQkJcmVmX2Nsa19mc2VsID0gMHgyNzsNCj4gLQkJYnJlYWs7DQo+IC0JY2Fz
ZSA1MDAwMDAwMDoNCj4gLQkJbXBsbF9tdWwgPSAweDMyOw0KPiAtCQlicmVhazsNCj4gLQljYXNl
IDEyNTAwMDAwMDoNCj4gLQkJbXBsbF9tdWwgPSAweDI4Ow0KPiAtCQlicmVhazsNCj4gLQl9DQo+
ICAJdmFsICY9IH5VU0JEUkRfVUNUTF9DVExfUkVGX0NMS19GU0VMOw0KPiAgCXZhbCB8PSBGSUVM
RF9QUkVQKFVTQkRSRF9VQ1RMX0NUTF9SRUZfQ0xLX0ZTRUwsIHJlZl9jbGtfZnNlbCk7DQo+ICAN
Cj4gQEAgLTUwNSw4ICs0MzQsNzIgQEAgc3RhdGljIHZvaWQgX19pbml0IGR3YzNfb2N0ZW9uX3Bo
eV9yZXNldCh2b2lkIF9faW9tZW0gKmJhc2UpDQo+ICBzdGF0aWMgaW50IGR3YzNfb2N0ZW9uX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICB7DQo+ICAJc3RydWN0IGRldmlj
ZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBkZXYt
Pm9mX25vZGU7DQo+ICAJc3RydWN0IGR3YzNfZGF0YSAqZGF0YTsNCj4gLQlpbnQgZXJyOw0KPiAr
CWludCBlcnIsIHJlZl9jbGtfc2VsLCByZWZfY2xrX2ZzZWwsIG1wbGxfbXVsOw0KPiArCXVpbnQz
Ml90IGNsb2NrX3JhdGU7DQoNClVzZSB1MzI/DQoNCj4gKwljb25zdCBjaGFyICpoc19jbG9ja190
eXBlLCAqc3NfY2xvY2tfdHlwZTsNCj4gKw0KPiArCWlmICghbm9kZSkgew0KPiArCQlkZXZfZXJy
KGRldiwgIk5vIFVTQiBVQ1RMIGRldmljZSBub2RlXG4iKTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7
DQo+ICsJfQ0KPiArDQo+ICsJaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJyZWZjbGst
ZnJlcXVlbmN5IiwgJmNsb2NrX3JhdGUpKSB7DQo+ICsJCWRldl9lcnIoZGV2LCAiTm8gVUNUTCBc
InJlZmNsay1mcmVxdWVuY3lcIlxuIik7DQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArCX0NCj4g
KwlpZiAob2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcobm9kZSwgInJlZmNsay10eXBlLXNzIiwgJnNz
X2Nsb2NrX3R5cGUpKSB7DQo+ICsJCWRldl9lcnIoZGV2LCAiTm8gVUNUTCBcInJlZmNsay10eXBl
LXNzXCJcbiIpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsJaWYgKG9mX3Byb3Bl
cnR5X3JlYWRfc3RyaW5nKG5vZGUsICJyZWZjbGstdHlwZS1ocyIsICZoc19jbG9ja190eXBlKSkg
ew0KPiArCQlkZXZfZXJyKGRldiwgIk5vIFVDVEwgXCJyZWZjbGstdHlwZS1oc1wiXG4iKTsNCj4g
KwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiArDQo+ICsJcmVmX2Nsa19zZWwgPSAyOw0KPiAr
CWlmIChzdHJjbXAoImRsbWNfcmVmX2NsazAiLCBzc19jbG9ja190eXBlKSA9PSAwKSB7DQo+ICsJ
CWlmIChzdHJjbXAoaHNfY2xvY2tfdHlwZSwgImRsbWNfcmVmX2NsazAiKSA9PSAwKQ0KPiArCQkJ
cmVmX2Nsa19zZWwgPSAwOw0KPiArCQllbHNlIGlmIChzdHJjbXAoaHNfY2xvY2tfdHlwZSwgInBs
bF9yZWZfY2xrIikgPT0gMCkNCj4gKwkJCXJlZl9jbGtfc2VsID0gMjsNCj4gKwkJZWxzZQ0KPiAr
CQkJZGV2X3dhcm4oZGV2LCAiSW52YWxpZCBIUyBjbG9jayB0eXBlICVzLCB1c2luZyBwbGxfcmVm
X2NsayBpbnN0ZWFkXG4iLA0KPiArCQkJCSBoc19jbG9ja190eXBlKTsNCj4gKwl9IGVsc2UgaWYg
KHN0cmNtcChzc19jbG9ja190eXBlLCAiZGxtY19yZWZfY2xrMSIpID09IDApIHsNCg0KRGlkIHlv
dSBydW4gY2hlY2twYXRjaD8gSSBzdGlsbCBzZWUgc29tZSBtaW5vciBmb3JtYXR0aW5nIGlzc3Vl
cy4NCg0KPiArCQlpZiAoc3RyY21wKGhzX2Nsb2NrX3R5cGUsICJkbG1jX3JlZl9jbGsxIikgPT0g
MCkNCj4gKwkJCXJlZl9jbGtfc2VsID0gMTsNCj4gKwkJZWxzZSBpZiAoc3RyY21wKGhzX2Nsb2Nr
X3R5cGUsICJwbGxfcmVmX2NsayIpID09IDApIHsNCj4gKwkJCXJlZl9jbGtfc2VsID0gMzsNCj4g
KwkJfSBlbHNlIHsNCj4gKwkJCWRldl93YXJuKGRldiwgIkludmFsaWQgSFMgY2xvY2sgdHlwZSAl
cywgdXNpbmcgcGxsX3JlZl9jbGsgaW5zdGVhZFxuIiwNCj4gKwkJCQkgaHNfY2xvY2tfdHlwZSk7
DQo+ICsJCQlyZWZfY2xrX3NlbCA9IDM7DQo+ICsJCX0NCj4gKwl9IGVsc2Ugew0KPiArCQlkZXZf
d2FybihkZXYsICJJbnZhbGlkIFNTIGNsb2NrIHR5cGUgJXMsIHVzaW5nIGRsbWNfcmVmX2NsazAg
aW5zdGVhZFxuIiwNCj4gKwkJCSBzc19jbG9ja190eXBlKTsNCj4gKwl9DQo+ICsNCj4gKwlyZWZf
Y2xrX2ZzZWwgPSAweDA3Ow0KPiArCXN3aXRjaCAoY2xvY2tfcmF0ZSkgew0KPiArCWRlZmF1bHQ6
DQo+ICsJCWRldl93YXJuKGRldiwgIkludmFsaWQgcmVmX2NsayAldSwgdXNpbmcgMTAwMDAwMDAw
IGluc3RlYWRcbiIsDQo+ICsJCQkgY2xvY2tfcmF0ZSk7DQo+ICsJCWZhbGx0aHJvdWdoOw0KPiAr
CWNhc2UgMTAwMDAwMDAwOg0KPiArCQltcGxsX211bCA9IDB4MTk7DQo+ICsJCWlmIChyZWZfY2xr
X3NlbCA8IDIpDQo+ICsJCQlyZWZfY2xrX2ZzZWwgPSAweDI3Ow0KPiArCQlicmVhazsNCj4gKwlj
YXNlIDUwMDAwMDAwOg0KPiArCQltcGxsX211bCA9IDB4MzI7DQo+ICsJCWJyZWFrOw0KPiArCWNh
c2UgMTI1MDAwMDAwOg0KPiArCQltcGxsX211bCA9IDB4Mjg7DQo+ICsJCWJyZWFrOw0KPiArCX0N
Cj4gIA0KPiAgCWRhdGEgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmRhdGEpLCBHRlBfS0VS
TkVMKTsNCj4gIAlpZiAoIWRhdGEpDQo+IEBAIC01MTYsNyArNTA5LDggQEAgc3RhdGljIGludCBk
d2MzX29jdGVvbl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCWlmIChJ
U19FUlIoZGF0YS0+YmFzZSkpDQo+ICAJCXJldHVybiBQVFJfRVJSKGRhdGEtPmJhc2UpOw0KPiAg
DQo+IC0JZXJyID0gZHdjM19vY3Rlb25fY2xvY2tzX3N0YXJ0KGRldiwgZGF0YS0+YmFzZSk7DQo+
ICsJZXJyID0gZHdjM19vY3Rlb25fY2xvY2tzX3N0YXJ0KGRldiwgZGF0YS0+YmFzZSwNCj4gKwkJ
CQkgICAgICAgcmVmX2Nsa19zZWwsIHJlZl9jbGtfZnNlbCwgbXBsbF9tdWwpOw0KPiAgCWlmIChl
cnIpDQo+ICAJCXJldHVybiBlcnI7DQo+ICANCj4gLS0gDQo+IDIuMzkuMg0KPiANCg0KQlIsDQpU
aGluaA==

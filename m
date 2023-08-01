Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69EEA76A5A8
	for <lists+linux-mips@lfdr.de>; Tue,  1 Aug 2023 02:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbjHAAnK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 20:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjHAAnI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 20:43:08 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71E9B19B4;
        Mon, 31 Jul 2023 17:43:07 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36VJpn7N028448;
        Mon, 31 Jul 2023 17:43:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=H7740v8a1ZUHwONMFUgnyRA5M7wIhuMsqRn8zB6Mwj4=;
 b=uIQa+BtrCALUrjb9H4yTDQX6AP/Y3qdXIkSPzpM3CTp8a0NfZ2jXF7BWXFa+lrViu0kW
 6iKf34YMfmBFzINXEpbPB+oCorAgXUbRW8wMrppBYNW4ekQXpb+3gBuB1RyedfY7ETV4
 VVVHtuZDw1WDR9rkiJvbG0ACJRkKerHBRCcwdxunVekXTCyh6xw2A39O7odggl7OKSE/
 t6+AI+BScqM/9WdHUyRqMNYkl1IDNRx1yfHb4EUhzp8v80fT+dgVLxlz6Jxc6I56+ata
 FeXE7nfdRuG3XQJG+bAf9zkaXL6ZuVQvOE6CkIsfvVauAypVMJA5I/5jd46G6+lE3HKi Vg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3s51dcswy5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 31 Jul 2023 17:43:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1690850582; bh=H7740v8a1ZUHwONMFUgnyRA5M7wIhuMsqRn8zB6Mwj4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=T30+AXfEvu/Rhs0lSBftv4JLjGmlp0msKbRwKySoGi/fUWGfB7yWE1kBieorVUp/m
         9bZF15VIJPNEqBkWnx3RwngS+P8CKe1LMvWgbcDVM50Kib1JLThAxiuTu69cbCKqRN
         guBnaSTZiTsnKM1eC5hOHY6CPc9nYihwivNdt6gvcXw4Q3dyN/sd61DzHmTCCL/k9b
         R1ohI70yg3kN7DMiRbuoVE0PI1dsBn/YPiMhqRKp4DvP51DBOQm2+t1quLsObv4Sti
         7BIoBGJtESe2Un05H7kZsBAVQYvtjuhylhjJdE2fPEMVOVBu+DLH0OZacMICoEAcHT
         VGuCW91A7fo4Q==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 79D4E401D2;
        Tue,  1 Aug 2023 00:43:02 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4E53FA0080;
        Tue,  1 Aug 2023 00:42:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=qABLUNAD;
        dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2043.outbound.protection.outlook.com [104.47.56.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 46BBD405DC;
        Tue,  1 Aug 2023 00:42:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgKdIsW+NcHv4C8tElSj5fKFtBFKzSmRchGOJFBz2ErWJerECxK9KgmEFbFAYNqUikhfKAS5k18/+NvCjhGF2PBIbpz+2yJNV+hfhEqhPlciYOlRWBh/7f+jv7vnHRnXt7G9yxByQi1C6PmAAkx0vH4GLiLn5D/zcRlqATuUgTKIFsJHWQFaNP6xbwhM24zQroBBy3q5NjnHBB950rHCqBwIgsbbGCpv6+YhIMBo+btSmdDomFtGeJ/OfYFF/bb7HlOQPBfLXUKAuguN+YasrGmPLTrEmDKRICUoAmw5eAeD+EG6dfU7Ubmucbpen7fH6IcIzVk/9DCvdHPsmXpsQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7740v8a1ZUHwONMFUgnyRA5M7wIhuMsqRn8zB6Mwj4=;
 b=I7Re85Upsqjlms8PtK6Mh2AmTnCUqtJ8Ox1dMeCSFIGZvftTu7ox3cIGx0ALsocMJRPrD31GCWeWdx5mhbmhzu7dDybZ1rgpmpF+G1OkwooKa/uRR8/wUDm3mOzbew/Nbed09a+rgXqBuXirGPuPhUMgrO4uk1aZs7/tDT1JV7rkGkx31V/EMCnIW/sS//FICexq0AUl9r2LcOZxJ5Vf9pc2mkXwtxMrsDs0ul09SJbh2gOLW8cYRDGgkH0ley68xJjuGwHMjtdQhnWG3bDgO4znGEr3b6srMHrsv0OtIZIJx7vBkq/SxwfkHtA5phSG8/TxWfWqcGbdVsEwkPJSKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7740v8a1ZUHwONMFUgnyRA5M7wIhuMsqRn8zB6Mwj4=;
 b=qABLUNAD7jfmh1LlZAKiLj75gWJoXVhGnH9rGsJCdGGakZiwb9QSuV4K/zrzUJh62M1ZoRKj8VzmfwX6RJA8Zlsms2mv5J3Hfm7ov0vKJGhYZfDD3k3qNGJqBN06lWleUYoVTdZE6DhXyK84WGTzw5WL946zW7n/AWy9MBdenT0=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SA3PR12MB7904.namprd12.prod.outlook.com (2603:10b6:806:320::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Tue, 1 Aug
 2023 00:42:32 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::138d:ed63:a424:1f33]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::138d:ed63:a424:1f33%5]) with mapi id 15.20.6631.042; Tue, 1 Aug 2023
 00:42:32 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5 5/7] usb: dwc3: dwc3-octeon: Move node parsing into
 driver probe
Thread-Topic: [PATCH v5 5/7] usb: dwc3: dwc3-octeon: Move node parsing into
 driver probe
Thread-Index: AQHZw5IBsbD2PIERfEO4lRE+NBAg2K/UmveA
Date:   Tue, 1 Aug 2023 00:42:31 +0000
Message-ID: <20230801004231.ydrs2xmeennpvax7@synopsys.com>
References: <ZMd/HzISn0mPsNWt@lenoch> <ZMd/x3MHA4/QowMO@lenoch>
In-Reply-To: <ZMd/x3MHA4/QowMO@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SA3PR12MB7904:EE_
x-ms-office365-filtering-correlation-id: ec3b16cc-695f-4e61-6324-08db922830e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OfhXJhBtALT3Wg1qLwyNdeuF40hsinlKbVuUn1ZPXQOqVL4ZklaWTbybZFffap3bpqswUsAes2glwNEv1BGBydYWvuoueRMa3kcDjudlNAqXWO4oqpfGq9gqaHV67jzjEuECY1alO28WuhuWXcXG7C96sRxZ5XYKwAGI+KtYC7infuUPyAHuifAumFWK5PujbYUwxTB1XcOelLFfHoQDd6PdYfZnHQT+IzYisHLebPOJ6bl0ZrAOkMU69tpFCNSROQ+dsmI45IJmGDDvWpyip79Cj5z9mD6TxVxB+dNbN3TNHCO5TnOb9IbVhIagAeUN9vJvvdJw6CkwMSObOjoKe4nC36xFlPJlQLRlt0XcsGdwK3+/fdpojO72nvf3ZwUF5XoE9/y/hdDlsABXv/i2la1OIe8kMLKXSt9fO6hWFtbEEkus9tje8ZNywNoK58L8ZrAlwKMNH5ItMkJaQV9ji79E1Un/B2UhxLIIgp0Fl+j84rwzakIGhnv05px0RwSIaAqVbhq9BCc6Y+STiZw4+Axi+GXD24eBvC8lZh/tEPHrzOAHYOSsZzVmLrCBF5e+57hgxJfT1q+qIjn4xoLfEmAtQb7qtmX7DqVCHo2gixN+x4JSQsyYR2Vz/VPrUBXC
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(6512007)(6486002)(36756003)(2616005)(6506007)(26005)(1076003)(83380400001)(186003)(76116006)(66946007)(66556008)(54906003)(122000001)(38070700005)(41300700001)(38100700002)(86362001)(66476007)(316002)(5660300002)(66446008)(6916009)(4326008)(8676002)(8936002)(64756008)(2906002)(71200400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlBBclRGNnhMd3NDQUJabW5naEJCQXhub0U4L2NqL2xRM2hJU0ZIS2tkMEV5?=
 =?utf-8?B?RWV5QTBCR3h5U0tNZGNUM09MZUo2UWdKNCtpZDQ4QlpHMFEwRXJ3WUlOU3Rv?=
 =?utf-8?B?c3NpdEpTWFFzM0NFWWd5WnRqTUtEQmYzSktjQnN2TmFleWIyWVZuc2h1ZERt?=
 =?utf-8?B?ellVZERwamFNTWZUaDdoTTlvRVFRUGNjbDkzeTdUcDNrbTBGUkdpMWV3VnBk?=
 =?utf-8?B?VXVYYzErbGhFNGNaTUh5RFZrOVJ5ZFNtYVROS2IvQVVmQlhzdlVaN244SjY1?=
 =?utf-8?B?eHhEdFhCV3k5Wm56UkRaOE9BbzJ2bUlFVEgzV0JoUlI5Y3l2WmI1dkc3Rlpo?=
 =?utf-8?B?cjVtREtVQUFVUkRPZ0FDRzNMVFVFSE92aTFPTUk3eGxSMnVBV20wMW5RMVE3?=
 =?utf-8?B?OE1INXpoUjdzRzVBbTR3RFBMQ2ZZakdtSlVBZzVqTXlKdlFOb1BDWDdWaEFl?=
 =?utf-8?B?RHVLWTJpcWhWeTVBWUxCOUdSaVpaVklSMUtnb2pkYTZQZkVtRVNWMDlwUTg2?=
 =?utf-8?B?MWU3cVFZK3M3Q0ZVNzV1ODFISUczL1hCRHB0amR1aGZHeVBMRDdxMldrazNj?=
 =?utf-8?B?cTdKbkpscEJSZVhhTTlNNnlReVFxem5NNTNscE9VaTFxbFRQc0hadFJORDZp?=
 =?utf-8?B?ZTd6SDFzbGRraU5CNlRKNFArRlMwTjBrL2NwR015RWprVEQ5Y0MvM2NSNDlS?=
 =?utf-8?B?QUlTam5BaUlFNTFKUnhIdUNPNVROZWNhNk9tRGZGdUhsbjFUbnozZjBLZ0Rk?=
 =?utf-8?B?T05rNndEd0d6SHAyWk9LclcyT2x3b2NHWVoxUFVZbG5Ca1NZalBaVVJaaHdL?=
 =?utf-8?B?eUtSL0NxSXRUNFlpOFdzK3dLL3MrSTFyTkltTHBaRU9RVlRvSVJjclNGcS9N?=
 =?utf-8?B?Z1FhOG9RL0FNN2Z3NUV2WFNiWmh6VWl6TFB1b1hxbVd3NGRNdkEvcjdnK1h4?=
 =?utf-8?B?YjBsVmtZYVlGR2VNUTF2M05yYnpqNEpIQWU2OS9aanFSa0U1TERaZDJGMFJX?=
 =?utf-8?B?K3BsVE1La0l6QzA2ZEQ5Z2xDQ042ZERoMUZoQmU2S05VMXZRWlhOSTBZcUNQ?=
 =?utf-8?B?d2lxaEdpSFRlamFnWW04RnpuOHdYVXNOMXZMZGZydm12cFQ0NGV3a0JROHZ4?=
 =?utf-8?B?UCtZbHVRWVZJOXFxK05XV1J5cTVoaUhJWlU4cWpRelB3Tk43V1RPOWVQRlIx?=
 =?utf-8?B?M25yL2FwbXI0MVN1clRCZGtFMnoxeXJCdWorNHpTaFpmdktqQlhjZGlHSyty?=
 =?utf-8?B?bkRtQ3VvRHV0cEM4UTFJQi9MRld5NmZOUWs2NUVwMGFxOUFTdEltd0hMcnRS?=
 =?utf-8?B?c2JqS1dmM3hFRHhRUGNqZnRPald4TjNha1AyajR6cWM2bUt4bXNwSlNVNjNk?=
 =?utf-8?B?Z3RpTWtmNjlxMTZNUFk3TjZucnFOTnV2M01sY0ZWUXVLcWkxblZyN3ZuWC9s?=
 =?utf-8?B?VFRFWVJRSHl6YWdoazdsMnprSXhmM1o4ZmNSK2tFaW5lWVZaV1YwcWpyenYw?=
 =?utf-8?B?Wm5oUVpCajdOWVZuNGN0TGpOS0JyQ1BXQjUrOUtnN3hML0tpSWR4TTUyNTZF?=
 =?utf-8?B?OHVFWjFMU0xuc1dRdFVQbFZwbXBYSjJ4R1R3UGNpaEcxK2RYb1RHaTJCSXk3?=
 =?utf-8?B?cnJWU3VZSnJRc3JBWjVIczgrS1RyVUlaT2J3RC9oekJvT1E3Tk9ENUdHYjds?=
 =?utf-8?B?V2VPZUs4UUdYVjY2OVNyZEpIVmxzTkljRFV4L0dNWW9OS0hMeWVaVk13R3VU?=
 =?utf-8?B?U0k0eE9xdFNBSGxCYU1FWVh6aG94dHM5RGdtYjhOMU4rcTUrT1VXT1ZzbTdX?=
 =?utf-8?B?bUVhcWRXT3NBYnFzaWoyVkxVRGVRV1IxcitqSTREU0pjejFDSTNWNHdGMmxS?=
 =?utf-8?B?ck1jQVZldHkwNmNsT3pZcGVPMDZhOXFiZ2YxWng3anZEa2F4Y1dTRThDZGxq?=
 =?utf-8?B?WHNyZmhucWhjSUUvbCtSOUpKQkVmRGdoSTd2cDRqaVVQd2JDTjdGMTNzYnBi?=
 =?utf-8?B?S3FiNjhXZU1kSWNzWGZHRTk5MFFmMkdrUHpYNlVIM09nZStER2NRemp6aVhY?=
 =?utf-8?B?VG94d25iZllTV09CZmRibDRVdGdZN01KRUIwK1VoYU1DMkxuVmxxKzJTeVVu?=
 =?utf-8?Q?/uO27xIJiZx1AnmYN/7JDrmPA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <72503117A0CAF842BE388E45A92D7DC3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?N3kzRzYwTzlvVVIxby9NTGlLcnczMDM0OUpnK0ttREpzczhUeVhTTzYxRWFw?=
 =?utf-8?B?MFJRMzd0NlpHSUx3YmN0WFdMZDlwR1BFdWVaRnMzRjR4aGVvRCsvbVNvZU5T?=
 =?utf-8?B?ZzJPV1JKcm5KU1REcmo1RFhXeXhZMWpQL0Nrd1ZQQ0YrSnBWVG9meHRLQTBN?=
 =?utf-8?B?T2FTdi9sWWJtRkFTOGx5VGVGMXNWUmRPMTRoM0VnUnZ1ZTdCUzJCbGVhYzVz?=
 =?utf-8?B?d2VwenY2elMxMTM4TUd5djl2Z0JvK0paRFRJMndwS1p0MEVSUDZiM2wvUmVH?=
 =?utf-8?B?eWYrWDFzRWVuMVJ1SGxmdUMrK1J0STc2VmJIQ1M5am5FSEtIQUtxZ2ErYWtj?=
 =?utf-8?B?N0Q2eldQeXZBQnZVUUNuM2kxdnNZaUMvc1ErOEpQbXlyZ2ZkMnVyRVdnRmNs?=
 =?utf-8?B?Z1ZLYnI4ZzBVYVZOenlQbzdkWE43UmR6dStSVmpMT2Vjb2ZNZWw5U00vcmlx?=
 =?utf-8?B?Ri94c21OUWoybUovMVNmMHQ4c3NOT09icmU5aTJwRjJhOFFTWnpNOGRSbDlI?=
 =?utf-8?B?cmRXVmYwQ1hVYk9qdzl6anJuZVplUUJQaFlYMENqL29HQ3JGSFlXaWpsYThY?=
 =?utf-8?B?dXR4aEIyOUFibmJjL2ozWitDcDRDclJUVUhDWEt0V1Y0OCs2T1YvckNTa2Ux?=
 =?utf-8?B?NnBJcm5mWFVldjRmV1ZFKzBYVGxCb2hoYkRKRVhrdWJwUGMzQUxzWEhsWVNx?=
 =?utf-8?B?WUYwVkYyWXl6WHd2M3BVOXFmck9qRTU4aThvWG9DR0Q4WVk4SXk3K0M3UDgz?=
 =?utf-8?B?VEVrSTZxb2IyM1pwc0FwcjMzaERxbUxGZ0QvU3ZETmNGbUJhNU5pQ01VZWgz?=
 =?utf-8?B?MWVySmtmN3duWmRFbEw4L25kaWNaM3I1a1VMc21pMTQ3Z1dPa2pOSkxFMEky?=
 =?utf-8?B?cGNSN3ZQOGhpcitLR3lSb0dwMlplWGdRc0tsRnNac1lMb2tzdFdEN29WTzNR?=
 =?utf-8?B?RkY0V2o3WTUwTmpiWkNPc2V2NFNzWTFnL0I2QWFQbWdyUW41WTVyeW9jOFIv?=
 =?utf-8?B?MVRkNm9UcmNMZThuM1JqV0ZLNmRGdlYwd3ZHeHZGdWNwNTFYUUxCKy85OVZy?=
 =?utf-8?B?MlR0QWJTYkx5NnRkMlJkSkZtUjJXVlczSCtBcDJlaGVJRVFqM1d3a2o1b1hX?=
 =?utf-8?B?b2RkdHZEQ3ZDVkJyTzlrWnV6N1JFb1NraEZiY0RleVphNDR4TmYyaUloOXBO?=
 =?utf-8?B?NVZPRm8wQnh3RUFiQVVwR2lTWTdKV2NWQkRrK2tobkFlY1YvV2JWcytxa2o2?=
 =?utf-8?Q?y2nMOZvpqPjg4fv?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3b16cc-695f-4e61-6324-08db922830e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 00:42:31.8948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TGL55hhJ9MAWwxeOQ8LOgrvVIsWOKcY69Kx2jEry0jXdd02KcGjf0LxXyUjz4B5ZRGMB5IdKD5jXFH8ACuCkHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7904
X-Proofpoint-GUID: GkoJaDlC8y5XSALX_LKbl-cUQnHbUFIV
X-Proofpoint-ORIG-GUID: GkoJaDlC8y5XSALX_LKbl-cUQnHbUFIV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_17,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
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
c2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IA0KPiBQYXJzZSBhbmQgdmVyaWZ5
IGRldmljZSB0cmVlIG5vZGUgZmlyc3QsIHRoZW4gc2V0dXAgVUNUTCBicmlkZ2UNCj4gdXNpbmcg
dmVyaWZpZWQgdmFsdWVzLiBUaGlzIGF2b2lkcyBuZWVkbGVzcyBhbGxvY2F0aW9ucw0KPiBpbiBj
YXNlIERUIG1pc2NvbmZpZ3VyYXRpb24gd2FzIGZvdW5kIGluIHRoZSBtaWRkbGUgb2Ygc2V0dXAu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMYWRpc2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5v
cmc+DQo+IC0tLQ0KPiAgQ0hBTkdFUzoNCj4gIC0gdjI6IGlmIGVsc2UgYmxvY2sgYnJhY2tldCBh
Y2NvcmRpbmcgQ29kaW5nU3R5bGUNCj4gIC0gdjM6IG1vcmUgZGVzY3JpcHRpdmUgY29tbWl0IG1l
c3NhZ2UsIHBvd2VyIGdwaW8gcGFyc2luZyBpbiBwcm9iZSB0b28sDQo+ICAgICAgICBjaGVja3Bh
dGNoIC0tc3RyaWN0IHBhc3NlZA0KPiAgLSB2NDogbW92ZSBjaGFuZ2VzIHVucmVsYXRlZCB0byBw
YXJzaW5nIG1vdmUgaW50byBzZXBhcmF0ZSBwYXRjaGVzDQo+ICAtIHY1OiBub25lDQo+IA0KPiAg
ZHJpdmVycy91c2IvZHdjMy9kd2MzLW9jdGVvbi5jIHwgMTM1ICsrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDc1IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rl
b24uYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYw0KPiBpbmRleCAwZGM0NWRkYTEz
NGMuLjMzMGJjYjU5Y2M5NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9j
dGVvbi5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYw0KPiBAQCAtMjYx
LDY5ICsyNjEsMTUgQEAgc3RhdGljIGludCBkd2MzX29jdGVvbl9nZXRfZGl2aWRlcih2b2lkKQ0K
PiAgfQ0KPiAgDQo+ICBzdGF0aWMgaW50IGR3YzNfb2N0ZW9uX3NldHVwKHN0cnVjdCBkd2MzX29j
dGVvbiAqb2N0ZW9uLA0KPiArCQkJICAgICBpbnQgcmVmX2Nsa19zZWwsIGludCByZWZfY2xrX2Zz
ZWwsIGludCBtcGxsX211bCwNCj4gIAkJCSAgICAgaW50IHBvd2VyX2dwaW8sIGludCBwb3dlcl9h
Y3RpdmVfbG93KQ0KPiAgew0KPiAtCWludCBpLCBkaXYsIG1wbGxfbXVsLCByZWZfY2xrX2ZzZWws
IHJlZl9jbGtfc2VsID0gMjsNCj4gLQl1MzIgY2xvY2tfcmF0ZTsNCj4gIAl1NjQgdmFsOw0KPiAr
CWludCBkaXY7DQo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gb2N0ZW9uLT5kZXY7DQo+ICAJdm9p
ZCBfX2lvbWVtICp1Y3RsX2N0bF9yZWcgPSBvY3Rlb24tPmJhc2UgKyBVU0JEUkRfVUNUTF9DVEw7
DQo+ICAJdm9pZCBfX2lvbWVtICp1Y3RsX2hvc3RfY2ZnX3JlZyA9IG9jdGVvbi0+YmFzZSArIFVT
QkRSRF9VQ1RMX0hPU1RfQ0ZHOw0KPiAgDQo+IC0JaWYgKGRldi0+b2Zfbm9kZSkgew0KPiAtCQlj
b25zdCBjaGFyICpzc19jbG9ja190eXBlOw0KPiAtCQljb25zdCBjaGFyICpoc19jbG9ja190eXBl
Ow0KPiAtDQo+IC0JCWkgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihkZXYtPm9mX25vZGUsDQo+IC0J
CQkJCSAicmVmY2xrLWZyZXF1ZW5jeSIsICZjbG9ja19yYXRlKTsNCj4gLQkJaWYgKGkpIHsNCj4g
LQkJCWRldl9lcnIoZGV2LCAiTm8gVUNUTCBcInJlZmNsay1mcmVxdWVuY3lcIlxuIik7DQo+IC0J
CQlyZXR1cm4gLUVJTlZBTDsNCj4gLQkJfQ0KPiAtCQlpID0gb2ZfcHJvcGVydHlfcmVhZF9zdHJp
bmcoZGV2LT5vZl9ub2RlLA0KPiAtCQkJCQkgICAgInJlZmNsay10eXBlLXNzIiwgJnNzX2Nsb2Nr
X3R5cGUpOw0KPiAtCQlpZiAoaSkgew0KPiAtCQkJZGV2X2VycihkZXYsICJObyBVQ1RMIFwicmVm
Y2xrLXR5cGUtc3NcIlxuIik7DQo+IC0JCQlyZXR1cm4gLUVJTlZBTDsNCj4gLQkJfQ0KPiAtCQlp
ID0gb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcoZGV2LT5vZl9ub2RlLA0KPiAtCQkJCQkgICAgInJl
ZmNsay10eXBlLWhzIiwgJmhzX2Nsb2NrX3R5cGUpOw0KPiAtCQlpZiAoaSkgew0KPiAtCQkJZGV2
X2VycihkZXYsICJObyBVQ1RMIFwicmVmY2xrLXR5cGUtaHNcIlxuIik7DQo+IC0JCQlyZXR1cm4g
LUVJTlZBTDsNCj4gLQkJfQ0KPiAtCQlpZiAoc3RyY21wKCJkbG1jX3JlZl9jbGswIiwgc3NfY2xv
Y2tfdHlwZSkgPT0gMCkgew0KPiAtCQkJaWYgKHN0cmNtcChoc19jbG9ja190eXBlLCAiZGxtY19y
ZWZfY2xrMCIpID09IDApDQo+IC0JCQkJcmVmX2Nsa19zZWwgPSAwOw0KPiAtCQkJZWxzZSBpZiAo
c3RyY21wKGhzX2Nsb2NrX3R5cGUsICJwbGxfcmVmX2NsayIpID09IDApDQo+IC0JCQkJcmVmX2Ns
a19zZWwgPSAyOw0KPiAtCQkJZWxzZQ0KPiAtCQkJCWRldl93YXJuKGRldiwgIkludmFsaWQgSFMg
Y2xvY2sgdHlwZSAlcywgdXNpbmcgcGxsX3JlZl9jbGsgaW5zdGVhZFxuIiwNCj4gLQkJCQkJIGhz
X2Nsb2NrX3R5cGUpOw0KPiAtCQl9IGVsc2UgaWYgKHN0cmNtcChzc19jbG9ja190eXBlLCAiZGxt
Y19yZWZfY2xrMSIpID09IDApIHsNCj4gLQkJCWlmIChzdHJjbXAoaHNfY2xvY2tfdHlwZSwgImRs
bWNfcmVmX2NsazEiKSA9PSAwKQ0KPiAtCQkJCXJlZl9jbGtfc2VsID0gMTsNCj4gLQkJCWVsc2Ug
aWYgKHN0cmNtcChoc19jbG9ja190eXBlLCAicGxsX3JlZl9jbGsiKSA9PSAwKQ0KPiAtCQkJCXJl
Zl9jbGtfc2VsID0gMzsNCj4gLQkJCWVsc2Ugew0KPiAtCQkJCWRldl93YXJuKGRldiwgIkludmFs
aWQgSFMgY2xvY2sgdHlwZSAlcywgdXNpbmcgcGxsX3JlZl9jbGsgaW5zdGVhZFxuIiwNCj4gLQkJ
CQkJIGhzX2Nsb2NrX3R5cGUpOw0KPiAtCQkJCXJlZl9jbGtfc2VsID0gMzsNCj4gLQkJCX0NCj4g
LQkJfSBlbHNlDQo+IC0JCQlkZXZfd2FybihkZXYsICJJbnZhbGlkIFNTIGNsb2NrIHR5cGUgJXMs
IHVzaW5nIGRsbWNfcmVmX2NsazAgaW5zdGVhZFxuIiwNCj4gLQkJCQkgc3NfY2xvY2tfdHlwZSk7
DQo+IC0NCj4gLQkJaWYgKChyZWZfY2xrX3NlbCA9PSAwIHx8IHJlZl9jbGtfc2VsID09IDEpICYm
DQo+IC0JCSAgICAoY2xvY2tfcmF0ZSAhPSAxMDAwMDAwMDApKQ0KPiAtCQkJZGV2X3dhcm4oZGV2
LCAiSW52YWxpZCBVQ1RMIGNsb2NrIHJhdGUgb2YgJXUsIHVzaW5nIDEwMDAwMDAwMCBpbnN0ZWFk
XG4iLA0KPiAtCQkJCSBjbG9ja19yYXRlKTsNCj4gLQ0KPiAtCX0gZWxzZSB7DQo+IC0JCWRldl9l
cnIoZGV2LCAiTm8gVVNCIFVDVEwgZGV2aWNlIG5vZGVcbiIpOw0KPiAtCQlyZXR1cm4gLUVJTlZB
TDsNCj4gLQl9DQo+IC0NCj4gIAkvKg0KPiAgCSAqIFN0ZXAgMTogV2FpdCBmb3IgYWxsIHZvbHRh
Z2VzIHRvIGJlIHN0YWJsZS4uLnRoYXQgc3VyZWx5DQo+ICAJICogICAgICAgICBoYXBwZW5lZCBi
ZWZvcmUgc3RhcnRpbmcgdGhlIGtlcm5lbC4gU0tJUA0KPiBAQCAtMzY3LDI0ICszMTMsNiBAQCBz
dGF0aWMgaW50IGR3YzNfb2N0ZW9uX3NldHVwKHN0cnVjdCBkd2MzX29jdGVvbiAqb2N0ZW9uLA0K
PiAgCXZhbCAmPSB+VVNCRFJEX1VDVExfQ1RMX1JFRl9DTEtfU0VMOw0KPiAgCXZhbCB8PSBGSUVM
RF9QUkVQKFVTQkRSRF9VQ1RMX0NUTF9SRUZfQ0xLX1NFTCwgcmVmX2Nsa19zZWwpOw0KPiAgDQo+
IC0JcmVmX2Nsa19mc2VsID0gMHgwNzsNCj4gLQlzd2l0Y2ggKGNsb2NrX3JhdGUpIHsNCj4gLQlk
ZWZhdWx0Og0KPiAtCQlkZXZfd2FybihkZXYsICJJbnZhbGlkIHJlZl9jbGsgJXUsIHVzaW5nIDEw
MDAwMDAwMCBpbnN0ZWFkXG4iLA0KPiAtCQkJIGNsb2NrX3JhdGUpOw0KPiAtCQlmYWxsdGhyb3Vn
aDsNCj4gLQljYXNlIDEwMDAwMDAwMDoNCj4gLQkJbXBsbF9tdWwgPSAweDE5Ow0KPiAtCQlpZiAo
cmVmX2Nsa19zZWwgPCAyKQ0KPiAtCQkJcmVmX2Nsa19mc2VsID0gMHgyNzsNCj4gLQkJYnJlYWs7
DQo+IC0JY2FzZSA1MDAwMDAwMDoNCj4gLQkJbXBsbF9tdWwgPSAweDMyOw0KPiAtCQlicmVhazsN
Cj4gLQljYXNlIDEyNTAwMDAwMDoNCj4gLQkJbXBsbF9tdWwgPSAweDI4Ow0KPiAtCQlicmVhazsN
Cj4gLQl9DQo+ICAJdmFsICY9IH5VU0JEUkRfVUNUTF9DVExfUkVGX0NMS19GU0VMOw0KPiAgCXZh
bCB8PSBGSUVMRF9QUkVQKFVTQkRSRF9VQ1RMX0NUTF9SRUZfQ0xLX0ZTRUwsIHJlZl9jbGtfZnNl
bCk7DQo+ICANCj4gQEAgLTQ4Myw4ICs0MTEsNjQgQEAgc3RhdGljIGludCBkd2MzX29jdGVvbl9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCXN0cnVjdCBkZXZpY2UgKmRl
diA9ICZwZGV2LT5kZXY7DQo+ICAJc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gZGV2LT5vZl9u
b2RlOw0KPiAgCXN0cnVjdCBkd2MzX29jdGVvbiAqb2N0ZW9uOw0KPiArCWNvbnN0IGNoYXIgKmhz
X2Nsb2NrX3R5cGUsICpzc19jbG9ja190eXBlOw0KPiArCWludCByZWZfY2xrX3NlbCwgcmVmX2Ns
a19mc2VsLCBtcGxsX211bDsNCj4gIAlpbnQgcG93ZXJfYWN0aXZlX2xvdywgcG93ZXJfZ3BpbzsN
Cj4gIAlpbnQgZXJyLCBsZW47DQo+ICsJdTMyIGNsb2NrX3JhdGU7DQo+ICsNCj4gKwlpZiAob2Zf
cHJvcGVydHlfcmVhZF91MzIobm9kZSwgInJlZmNsay1mcmVxdWVuY3kiLCAmY2xvY2tfcmF0ZSkp
IHsNCj4gKwkJZGV2X2VycihkZXYsICJObyBVQ1RMIFwicmVmY2xrLWZyZXF1ZW5jeVwiXG4iKTsN
Cj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiArCWlmIChvZl9wcm9wZXJ0eV9yZWFkX3N0
cmluZyhub2RlLCAicmVmY2xrLXR5cGUtc3MiLCAmc3NfY2xvY2tfdHlwZSkpIHsNCj4gKwkJZGV2
X2VycihkZXYsICJObyBVQ1RMIFwicmVmY2xrLXR5cGUtc3NcIlxuIik7DQo+ICsJCXJldHVybiAt
RUlOVkFMOw0KPiArCX0NCj4gKwlpZiAob2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcobm9kZSwgInJl
ZmNsay10eXBlLWhzIiwgJmhzX2Nsb2NrX3R5cGUpKSB7DQo+ICsJCWRldl9lcnIoZGV2LCAiTm8g
VUNUTCBcInJlZmNsay10eXBlLWhzXCJcbiIpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9
DQo+ICsNCj4gKwlyZWZfY2xrX3NlbCA9IDI7DQo+ICsJaWYgKHN0cmNtcCgiZGxtY19yZWZfY2xr
MCIsIHNzX2Nsb2NrX3R5cGUpID09IDApIHsNCj4gKwkJaWYgKHN0cmNtcChoc19jbG9ja190eXBl
LCAiZGxtY19yZWZfY2xrMCIpID09IDApDQo+ICsJCQlyZWZfY2xrX3NlbCA9IDA7DQo+ICsJCWVs
c2UgaWYgKHN0cmNtcChoc19jbG9ja190eXBlLCAicGxsX3JlZl9jbGsiKSkNCj4gKwkJCWRldl93
YXJuKGRldiwgIkludmFsaWQgSFMgY2xvY2sgdHlwZSAlcywgdXNpbmcgcGxsX3JlZl9jbGsgaW5z
dGVhZFxuIiwNCj4gKwkJCQkgaHNfY2xvY2tfdHlwZSk7DQo+ICsJfSBlbHNlIGlmIChzdHJjbXAo
c3NfY2xvY2tfdHlwZSwgImRsbWNfcmVmX2NsazEiKSA9PSAwKSB7DQo+ICsJCWlmIChzdHJjbXAo
aHNfY2xvY2tfdHlwZSwgImRsbWNfcmVmX2NsazEiKSA9PSAwKSB7DQo+ICsJCQlyZWZfY2xrX3Nl
bCA9IDE7DQo+ICsJCX0gZWxzZSB7DQo+ICsJCQlyZWZfY2xrX3NlbCA9IDM7DQo+ICsJCQlpZiAo
c3RyY21wKGhzX2Nsb2NrX3R5cGUsICJwbGxfcmVmX2NsayIpKQ0KPiArCQkJCWRldl93YXJuKGRl
diwgIkludmFsaWQgSFMgY2xvY2sgdHlwZSAlcywgdXNpbmcgcGxsX3JlZl9jbGsgaW5zdGVhZFxu
IiwNCj4gKwkJCQkJIGhzX2Nsb2NrX3R5cGUpOw0KPiArCQl9DQo+ICsJfSBlbHNlIHsNCj4gKwkJ
ZGV2X3dhcm4oZGV2LCAiSW52YWxpZCBTUyBjbG9jayB0eXBlICVzLCB1c2luZyBkbG1jX3JlZl9j
bGswIGluc3RlYWRcbiIsDQo+ICsJCQkgc3NfY2xvY2tfdHlwZSk7DQo+ICsJfQ0KPiArDQo+ICsJ
cmVmX2Nsa19mc2VsID0gMHgwNzsNCj4gKwlzd2l0Y2ggKGNsb2NrX3JhdGUpIHsNCj4gKwlkZWZh
dWx0Og0KPiArCQlkZXZfd2FybihkZXYsICJJbnZhbGlkIHJlZl9jbGsgJXUsIHVzaW5nIDEwMDAw
MDAwMCBpbnN0ZWFkXG4iLA0KPiArCQkJIGNsb2NrX3JhdGUpOw0KPiArCQlmYWxsdGhyb3VnaDsN
Cj4gKwljYXNlIDEwMDAwMDAwMDoNCj4gKwkJbXBsbF9tdWwgPSAweDE5Ow0KPiArCQlpZiAocmVm
X2Nsa19zZWwgPCAyKQ0KPiArCQkJcmVmX2Nsa19mc2VsID0gMHgyNzsNCj4gKwkJYnJlYWs7DQo+
ICsJY2FzZSA1MDAwMDAwMDoNCj4gKwkJbXBsbF9tdWwgPSAweDMyOw0KPiArCQlicmVhazsNCj4g
KwljYXNlIDEyNTAwMDAwMDoNCj4gKwkJbXBsbF9tdWwgPSAweDI4Ow0KPiArCQlicmVhazsNCj4g
Kwl9DQo+ICANCj4gIAlwb3dlcl9ncGlvID0gRFdDM19HUElPX1BPV0VSX05PTkU7DQo+ICAJcG93
ZXJfYWN0aXZlX2xvdyA9IDA7DQo+IEBAIC01MTUsNyArNDk5LDggQEAgc3RhdGljIGludCBkd2Mz
X29jdGVvbl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCWlmIChJU19F
UlIob2N0ZW9uLT5iYXNlKSkNCj4gIAkJcmV0dXJuIFBUUl9FUlIob2N0ZW9uLT5iYXNlKTsNCj4g
IA0KPiAtCWVyciA9IGR3YzNfb2N0ZW9uX3NldHVwKG9jdGVvbiwgcG93ZXJfZ3BpbywgcG93ZXJf
YWN0aXZlX2xvdyk7DQo+ICsJZXJyID0gZHdjM19vY3Rlb25fc2V0dXAob2N0ZW9uLCByZWZfY2xr
X3NlbCwgcmVmX2Nsa19mc2VsLCBtcGxsX211bCwNCj4gKwkJCQlwb3dlcl9ncGlvLCBwb3dlcl9h
Y3RpdmVfbG93KTsNCj4gIAlpZiAoZXJyKQ0KPiAgCQlyZXR1cm4gZXJyOw0KPiAgDQo+IC0tIA0K
PiAyLjM5LjINCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5v
cHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o

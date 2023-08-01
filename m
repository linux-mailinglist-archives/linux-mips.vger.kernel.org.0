Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51B8676A551
	for <lists+linux-mips@lfdr.de>; Tue,  1 Aug 2023 02:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjHAAHH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jul 2023 20:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjHAAHG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jul 2023 20:07:06 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD221726;
        Mon, 31 Jul 2023 17:07:05 -0700 (PDT)
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36VJqELs025976;
        Mon, 31 Jul 2023 17:06:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=08SGFHXf1Du6whbZw+aVRq1vHQAeHvtcNXiCLhBM+yk=;
 b=rwANWmWyA2ujseXra0AnHY7UgZNAnbsYwtxb1Ppfd48DUgRQ4p5Aea/fupYxFNcu0wP8
 e/tkPc9UjY9NN1O3YJhVqV4vU779g2MnYS2gbtfHMn1V03dSOdCXY53jbGKwlPHRMkzh
 MzJCLcK9H1yKL6HdGqnNTfTfoCusahiihWKA3PD4eL6R7RXLnqIu370tPVxZzdiizxEu
 bhk82EXEf6I4Lxfr8F77KP8CzVYUON/R+3v3FK/tBamao9rHvTpbzyZ3sum0zoxnLGbQ
 saGEmJVWnlqG7s96DGzLcJQu/kyqfihJl2zZFvrFaer2df1slqtmZKdGL4K0s1I7mH6H qQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3s51pssqt2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 31 Jul 2023 17:06:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1690848416; bh=08SGFHXf1Du6whbZw+aVRq1vHQAeHvtcNXiCLhBM+yk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=NDdUeQMcZq7OWs2MUtYb44YnwpSSh2dg/wbbKapyZB76ZL6horA1COqL7oT93TWY3
         b2AMumm3WgT96+aBa8/kln3BY5i1n/y3yTGQ995oGDLHEH0bq8f/frzyEIhf/7K7K1
         ZMT6XtxTLPjqQ6n2IoBLLjujB/60qs7mqDsgo9S5sHGVK2nRe5tRwfG9tfeUSVpIof
         Ao2P59tjx6FtYb+MgdhPX90u08fB6iLn2uHWK2X7JWW7Oq7B2kQLGxk+I9saFMyHjB
         cMno9g6Zfb6Xlm+oYu2Ex3tktUjUSE6tSBQcn/BhrkjK8rAVXenQxlwMccjZst2mhP
         fIMEwIwa5sEww==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 94E32405CA;
        Tue,  1 Aug 2023 00:06:56 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 9F4E1A009C;
        Tue,  1 Aug 2023 00:06:54 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ByHzJXV6;
        dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3075E404F3;
        Tue,  1 Aug 2023 00:06:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEzPBMewhq+lBCbNUqgYYsIDD2VnC+EZ3maQM7Cn+pY92cjjx44HG+JhVMpVqHHzQzQTYchGkTmTkrqICLmMWHo4/BinUs7Zwq+JPU0fqvLYiExDwzS67yuWjtqhjl3mL7xypE8ECa1trhVce+r/1FGPhHRpd77V+QX/D1aHbxsPz/Gzce5w/ZYEqn3DOiCgdyQ2jjQCmLkkyZJZyTVoKcdEmkiJimtZocHbmKH0qyFFvxhTE7mSjIE7fOka83bGwDDuQiObtKI5EMc1rhJFIDN30nASx4BZcaA98MEtf3w6rO5g0MCmyuBRN1GFEXInTgdWxk728tt4lifM9p9muw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08SGFHXf1Du6whbZw+aVRq1vHQAeHvtcNXiCLhBM+yk=;
 b=cRa/a8mqRziZMe7SHa7TIbGA8NSFEzTWyQxSrVX3yPpmNqoY1FYLWXu997y4VG6tHYgSva83YwsJZQ3YCN9kZC/AbKxe2lRPqNUG5MHp0XOQcoX/EyJC9kTmqhakgBe97x6UD6NangElGjRSWpSwBaqoFvIqW8upch09u5BZ6LyTEYWa4uaSxG/aMJFcq3Dz+UGImYgo8TKHLfXXje8be94zddX8TkhRrIXs6XyOSF0x9bozH6Rk9Xx+4maAlzr69kUUUdA6apIbszr5lHZ9ZgA/1hQ/FC20kQfAMannrdo9BAdNR14sb/eq7ApjdK69r8zhut/seGsTXvNcd/EAqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08SGFHXf1Du6whbZw+aVRq1vHQAeHvtcNXiCLhBM+yk=;
 b=ByHzJXV66ml/uwYfVGZVNoPel2rV9JqTyhPbLyD8qTUpAZJfQw5KsDhig4Un6blQf4d6R/mEZJFekGNwhj7sNRGtny0A4QmR+upGPnX9OPm0U2+I2w/WnCDxnxkTwogRUq4rEKCZYKKen+aRuOLk0OvoQjxNzRKDDWKzmI34ed4=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4886.namprd12.prod.outlook.com (2603:10b6:a03:1c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 00:06:52 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::138d:ed63:a424:1f33]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::138d:ed63:a424:1f33%5]) with mapi id 15.20.6631.042; Tue, 1 Aug 2023
 00:06:51 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v5 3/7] usb: dwc3: dwc3-octeon: Pass dwc3_octeon to setup
 functions
Thread-Topic: [PATCH v5 3/7] usb: dwc3: dwc3-octeon: Pass dwc3_octeon to setup
 functions
Thread-Index: AQHZw5HX5aTXomgJEEmUNFwyTvSMGa/Uj44AgAABbwA=
Date:   Tue, 1 Aug 2023 00:06:50 +0000
Message-ID: <20230801000648.l6w46i7uu2mvej54@synopsys.com>
References: <ZMd/HzISn0mPsNWt@lenoch> <ZMd/gt58laSlqAAT@lenoch>
 <20230801000140.cgl5jo4z3tatxyna@synopsys.com>
In-Reply-To: <20230801000140.cgl5jo4z3tatxyna@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|BY5PR12MB4886:EE_
x-ms-office365-filtering-correlation-id: 29559639-71dc-469c-a9b2-08db92233559
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AsWSToRN1Ng8TBLCP/EICw61+kT24+pjGfZlVCqvo1x6oYXEmzEybtMowdtXxkI2tXysWnROhbU5FsohGZiTRgRTEb75wlPlbN2er4q7E+8YPrY7QESNCRbM+YHjF5tecDZHYZAWNr8CcBhlOXBFamS8yC4Tb84FpmczHMfcjnWp/vF4Fv8eKbYjNzVpqV8w8oz2rgcv+5ESQ36OTWZytFoDonlzUdbgv3KeQqYpA6JqblS7r97dIH1pKjTqJtL+DPxs1W5Ds57MyPCkPeApUXIj5bmt3mBwmbnUlhmk8syvveLn02nANj0bsQUe8hqh5DnuFdEXPQ99Zl8GBOLG0VHZHjQMgWWUxzBV02SgvX08bzEkjwgQSbM7ZKnZJpdgCgB7kNvgXYHBV1EN/1z49BMf9RK2Pj0/KUMRJWIrX4wLco/iHl2IXuCj/KB/3IjMGJlIw4A/yLGXtxt3teKd+5Npkl2ceiuGT9SWcgjknX2YbdrDis7gsdiOcBKSCEslOPFvheEVy5j+hjYMqe/nyo1ffrs+qwDV82YnZcdEucLxETqndJIljTO9F6GazPNcMAp/rDpuBjxVLhpPccrBTPCSK5NJKq/5fTR+ZhSCFaa5JXwNm3sxFR6VDw5Y04bW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39850400004)(366004)(376002)(346002)(451199021)(2906002)(5660300002)(8676002)(8936002)(4326008)(316002)(6916009)(66476007)(64756008)(41300700001)(66946007)(66556008)(66446008)(76116006)(36756003)(38070700005)(2616005)(71200400001)(26005)(186003)(122000001)(38100700002)(83380400001)(478600001)(1076003)(6512007)(6486002)(6506007)(54906003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDgxZjhMbWRtMjE3dWxYREUrVTUwdlJtVnNkM0RoRGpaMUw2KzlMZUkzbGx0?=
 =?utf-8?B?VUtiNjNIbERoNzFKQ3J1WXBZa0QybSt0TmVVUEVHTkg1RTJncUZXTHFnYklS?=
 =?utf-8?B?RXFDUWM0UzhNUmd3K0tjSU9EQUQwSjZzYkF6a095ZVRacGdXWS9ndVNoZEc1?=
 =?utf-8?B?L20rWlIvZzdOeDlZNC9UU1BEZVZDdXZYRFI0OUIyK01Jb3R2RThtNUF0UEhH?=
 =?utf-8?B?a2FZMVFDeXZnVjA4MngyOHNELzBMeW9YT3dFcU9Rd0Z1TkFHcS85UDFGSGFX?=
 =?utf-8?B?SG1vYW4zMXg2cGpjVVo2MmJQK2doaHZ0VEh1ZXFXeElCeWNHeFVmamxYNlBn?=
 =?utf-8?B?VDFWWjd2SzdObmVRVTVqSnFzQkpuWkxKT2owQzNzdVVwaHVudFd1RVBLNkRH?=
 =?utf-8?B?eFhtdGR1SXovWmhiZDVpdjBROTBqbnJDY3oydUhZQkJLb2l2NG1IV0Y3dU5Q?=
 =?utf-8?B?bVRrcHR0ZnltTEpsVjBsSlhpNlhvMzJiQ2JSdHltY2c2K3FXckJudnY0M01y?=
 =?utf-8?B?NlZXN05rYlQ3elhCeUxyTjRUMmJSak9sK1pjN3F3THlVWEF6RWpLeGhBUnJa?=
 =?utf-8?B?Z3Y2MGdOZE95blFrcU9HVEFZMkFya2lmVEVQNjlTbEgrNS9FZlFBWU1vaEdU?=
 =?utf-8?B?K05xckN0aUtMR010OUttSlRaa0xhYjcwNXVNQkQzWGk1RHpGTmRKejdsRVpX?=
 =?utf-8?B?UVFsK3ZZMmx0Ylp4bkJlNlZJNzZTMHFqNldNNCtwWFczOHdvWVVhNnd3YlV1?=
 =?utf-8?B?L2xWZE83ajVLWm9ldTNEdWVGZ1NYTk5zZEhSbHVwdjVRc0pBaTUyZHBXa3kz?=
 =?utf-8?B?Q1VoalhpTlJ1dnZ3L1JyZU9LVEdUMHNFQjFCM1R4VUN0QndLalgyM2FIVEdm?=
 =?utf-8?B?R09xZTJvU0J5Z3JUV2U1STRYV1ZxblloVEhsNkZ5enBXMXZTb0w3K0VBSElk?=
 =?utf-8?B?dGwyeEcvblo0eU1iMHBUcUdKbFJOMW1Uek16K3l6YitjNHk5NWNqOE5GeFFh?=
 =?utf-8?B?YUNzRlFsUnV5NlNXdVZVdSs3T0RHdEFoR3Eza1dCTG5Pa3F3ZWRndVBtckdD?=
 =?utf-8?B?S1RFbHZvdk9uamNmeVVxamdYV0Q3b05tQTF3MnlVUlNwQy9IYm95QkFXOWdZ?=
 =?utf-8?B?NEJSaStES1N4aE1reEJ2b3NuQUxWQlRueDRnMVBOYURNQzY1WXJvNEhtMHow?=
 =?utf-8?B?QnE5NnFjMjg5K0lqN0tON25jUzZrUGdWL09lcnpkaGVsUkNZTFFjR21EN1ds?=
 =?utf-8?B?a2FQcFVrQjk2RGVodVRrUGdFdUQ4R2NOVXpQVWthR1h4VStqR2NXK3RBQVNU?=
 =?utf-8?B?YnZJQjJYMTVvZnczOUZnemc2Vi9tVDJXalhPaWM4WkF0SStINDlSa1REUWk0?=
 =?utf-8?B?cmZJNXE2cmtDVkdqdEZVR1ErT0pNUFpvWDN3VUxHVEczOVRNNDczMU5oMFd3?=
 =?utf-8?B?VDB3VkhRU3pNNGI5dzg4OElSMUx3QW04MGwyQ0lRT0VOeXBKV1QvQ0M3aEdp?=
 =?utf-8?B?aHdSQ1BjeUg4UnZFZi9SVGZZU1VuYThMY2V0b1dEZ2xHenFXUnRUdFIxRSt1?=
 =?utf-8?B?WDl5ME9ON3lpMndxUGRkVzJBNko2WVdsRDN4eDhLbjI5dExqc0JyUFE5UU92?=
 =?utf-8?B?QmtqcUJzcnZPdGdoeFViSDMrWUREWlNHcm1mQXpaMEdDVEU2WE04YTF4ZXc3?=
 =?utf-8?B?ZDZiYmV6a3ZiYUVmTE1BWS9iWXJCMlRPNkQ5SnZPZDRKOVcxVjdjSU5YOGFM?=
 =?utf-8?B?WUpVSWZkMHFndUYvcGs4djZzVVNoQTdFQVI3TXBaVEgzZHF6aXFoK1dNWDBo?=
 =?utf-8?B?WkNHd0F4azhuV3AxVDhzb3VNR0o3Y1BrdVVrZkVlMVFuK2ZhRXlQay9VOXpC?=
 =?utf-8?B?YzA1QUxKWTAzTzVjcWxCQWNOL0QvbzhmeGFYTTh4MlZGWWZoMjFBSGZ0ZS9v?=
 =?utf-8?B?cGUrSHRWUFFOZ1Job04rbm9yMDhNVC9QSHgzNVZMaTBZald5L3BlNUpnampx?=
 =?utf-8?B?ckxrTklXQ0ZYKzV3RDhpMUNaZmFQaEdGVnRwNHl1dWZhcHMxOFBTSDc2U1Av?=
 =?utf-8?B?L0cwY2F0RzBQVWczSkhzcDNMWEEyeGovSGVIdHFhUHRac1lxdndzYmdmWVpB?=
 =?utf-8?Q?8Qqse/ccCoyBoCKJURojQBdOa?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BBA64491D89D341B31662AAB3C50703@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?QU41Ynl2U2xZejVCbTE0NE1kRUd2R0pLcFE5NFlWTDY3Z3B0aXl2bmVrd3Z1?=
 =?utf-8?B?MnlHS1JScktWLyt6eGNWcmg1Y0RGRmFCekJQSHlSeXFqNGVNS3Bnekg4SGpi?=
 =?utf-8?B?c1lUUjNCamFPSEtyRXlGdlExbjFjWmRoMnRubW05aTJPdkpGcXJ4UXZSZjhm?=
 =?utf-8?B?QSt5bjJUTW1kdUdBZEZ6MkpHMzhaK2FZMjFkQ3BtYUlETVN4SURiLzRYWjhj?=
 =?utf-8?B?ellTNDdwQ3lhKy8zeDlaWUgzTFdLcEU5MFNpYnVQZ1hzQ1ZZc1MyUFBQdWR3?=
 =?utf-8?B?ekdNRExtd0NicXRLdWFUTUZNNE5FdkNTM2FjR0wrcTNCTkdUUVpsZ1dSaHhh?=
 =?utf-8?B?bGNIYmdUUHJyT2VCdHNHUk1aaENaOENwZW1adTZsSlJuaU1EWXBVNFpMOTJo?=
 =?utf-8?B?SnRQaXl4SXFpbVFTYWhvU2xDV2dwWk9oZkw2bjVtN05jb0NncEpJNUIxWGZj?=
 =?utf-8?B?d1cxWHd4TjRRV0NQQVJGbmdTcE8vcU1TQmQ0a0drSVBBRHRHSThaZkVnYkNX?=
 =?utf-8?B?MDU5YW5CYUhxMW5obHd5VjU5UUNQcUcvZUdBQitKZjRXbW41NXg4MjYvenBu?=
 =?utf-8?B?ZDFnaEFBTitRdVhTcnZxL255Yk90azRsek0wSVo4bWpOdlcrYzZOczJScTdC?=
 =?utf-8?B?K3EvVkNLa1NLZDJ5RE1BdXdHY0kyd1B4NURkejNpMjdIWnVldmRHSUxLcWVS?=
 =?utf-8?B?M3B5Vm1lb1RxSStkU1RuYjFaWWVxZklZeGFZaGovWDNQWU5hYjgzZUtlYTZl?=
 =?utf-8?B?M0JrUWVVOGliWGRMcWNISDQwSUIvWFlFTjJWOWtybVdteHBSSWFiamJLVi9z?=
 =?utf-8?B?SExCcUJiQ1puWnNpUEs5ak9DcUJ6MTdiN3RleklNVGtiSGFYaTc1eWNDMHJQ?=
 =?utf-8?B?UE02cHJzYnV6Rkp6dXdnYVo2WnplNkFBNVNJYTRlcFo4R3NzRy9IOEZFMXlL?=
 =?utf-8?B?OVk5aFVXQW1TUTladmxBT0h5MFhZeklGbCt0VS9XSG5jODdYREJzUE8vT1li?=
 =?utf-8?B?Tkc5UTZNSkhFZlR0VmhPL0N0S2lXNGQyNTI0elkrM2JLTU1vekVVWkx1VnU4?=
 =?utf-8?B?ZWZ0WkRHYng1YzV2T0hpRTVXNC96Zk4rbUJJNHlZaWx1TlJza1EvYmdFbllG?=
 =?utf-8?B?L3pmRDdZYTFxaEtMZkdPcm1ZMVNVY3NLUkxmMGpJNDl5OFZ6bGpTMDRmend5?=
 =?utf-8?B?cVRrTUNyZGVlYVBqUnZBWVpnbUNFa2RTNis4aUpaRWpFbXNGay9Nb09IOHY3?=
 =?utf-8?Q?RzR0nHoDUrOqpmn?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29559639-71dc-469c-a9b2-08db92233559
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 00:06:51.9548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tDRcabVrl9yFw+oZE8lbjzC5vBYaFvUdTiBrLCzhr69xoWL0SYZnrgs6PjdG3P1x6CEmbyn7X0dI6+g5Degh3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4886
X-Proofpoint-ORIG-GUID: wrTJPakd810e80JwMNUcg-Wg0V3kWWXc
X-Proofpoint-GUID: wrTJPakd810e80JwMNUcg-Wg0V3kWWXc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_16,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=823 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307310218
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gVHVlLCBBdWcgMDEsIDIwMjMsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gTW9uLCBKdWwg
MzEsIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiA+IEZyb206IExhZGlzbGF2IE1pY2hs
IDxsYWRpc0BsaW51eC1taXBzLm9yZz4NCj4gPiANCj4gPiBQYXNzIGR3YzNfb2N0ZW9uIGluc3Rl
YWQgb2YganVzdCB0aGUgYmFzZS4gSXQgZml0cyB3aXRoIHRoZQ0KPiA+IGZ1bmN0aW9uIG5hbWVz
IGFuZCBpdCByZXF1aXJlcyBsZXNzIGNoYW5nZSBpbiB0aGUgZnV0dXJlIGlmDQo+ID4gYWNjZXNz
IHRvIGR3YzNfb2N0ZW9uIGlzIG5lZWRlZC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBMYWRp
c2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+ID4gUmV2aWV3ZWQtYnk6IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gPiAtLS0NCj4gPiAgQ0hB
TkdFUzoNCj4gPiAgLSB2NDogbmV3IHBhdGNoDQo+ID4gIC0gdjU6IFBoaWxpcHBlJ3MgcmV2aWV3
IHRhZw0KPiA+IA0KPiA+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMgfCAyMyArKysr
KysrKysrKystLS0tLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgMTEgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3
YzMvZHdjMy1vY3Rlb24uYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYw0KPiA+IGlu
ZGV4IDY5ZmU1MGNmYTcxOS4uMjRlNzU4ODFiNWNmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy1vY3Rlb24uYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1v
Y3Rlb24uYw0KPiA+IEBAIC0zMDAsMTIgKzMwMCwxMyBAQCBzdGF0aWMgaW50IGR3YzNfb2N0ZW9u
X2NvbmZpZ19wb3dlcihzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgX19pb21lbSAqYmFzZSkNCj4g
DQo+IE1heSBhcyB3ZWxsIGRvIGl0IGZvciBkd2MzX29jdGVvbl9jb25maWdfcG93ZXIoKSB0b28/
DQo+IA0KDQpOZXZlcm1pbmQgdGhpcy4gSSBqdXN0IG5vdGljZSB5b3UgcmV3cm90ZSB0aGlzIGZ1
bmN0aW9uIGxhdGVyLiBJZ25vcmUNCnRoaXMgY29tbWVudC4NCg0KQWNrZWQtYnk6IFRoaW5oIE5n
dXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=

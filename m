Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF8DB744533
	for <lists+linux-mips@lfdr.de>; Sat,  1 Jul 2023 01:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjF3XZQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Jun 2023 19:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232908AbjF3XZP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Jun 2023 19:25:15 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C3F3ABF;
        Fri, 30 Jun 2023 16:25:13 -0700 (PDT)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35UIPjKE003325;
        Fri, 30 Jun 2023 16:25:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=pZ5Rf4F03Y0f5GNm5yaoPyCMufX8aJh8dBe8hg4gaqA=;
 b=RCQj++UxXjY5Z0zu/aZazPdpwXqMa0wCSZhDK+RQTND8GkgbQx2DrOjQfpP0Ap+9tuf1
 UUODd8Wq5Ik9LFnm4n4Tj1Hy/Z6ZJLRPTqKeR61iktRt6T1Ub0skHqEPDvn2LFSII7nM
 twxdQMSpE0ze7UGZibM30Rfhz+DVINrPgs89Fj/eLc2trWSUoPFc0A50QYI1aRKTzB7w
 /2wqd9PaIWGqcuuYkAjqj2ZbsyCNF1nq3TJ0Gz+1r39wg0F7tzHdEOZsH/E4vFLr6rIM
 ZH8pmzrWZi+mHjluvoVz7iLMhbXW1Dsgr9mygkOm+WqEYGoZXbiaqAtViDUeJ0/JYZuQ yQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3rdygmyds4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Jun 2023 16:25:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1688167509; bh=pZ5Rf4F03Y0f5GNm5yaoPyCMufX8aJh8dBe8hg4gaqA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Vh3fKM3sr6urIKh8i1+uPvfw3XVRjVLG1wQSSR6kybZcsrsCwwjx5XP303vasKF/R
         VIdw3Y62sk3LzZSPhnUlY60R5nqlIU9vZrDSPEw2gzzyuv82OCABfXDUz9TOdcX4fu
         zGdtphTZebZBSNjtKKfEbpVMKEQkACsuEFsw7rjEjGksqCLZMtiGiXG4O4P0zM53Oz
         MngwfIRcfhhI0iCVvmGpRQI5mgaHFOWFvYZ2D5JG7UAgJzHqDojPml9/kjbO5TO9qf
         s4s/9tyfG5i9RFqPkdrW8K2FugPwuYxe+iQ6iIwR9WWFk9L688+PcxvsdArOz4PMLJ
         yOkpuDJymrwtA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CDA5F40147;
        Fri, 30 Jun 2023 23:25:09 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 8637BA00D1;
        Fri, 30 Jun 2023 23:25:08 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dknxAAkO;
        dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 54AD140353;
        Fri, 30 Jun 2023 23:25:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoeWf4AiKUJ/pAuk5k7+YxUVA4rX009rSMRv5nzAqMA/eNNvch6cJNPHxRerKv22JBSlXSnfbf/sULQ7G9uzAUGyDRbUK5YpGHG8HDAFMoRV3RlL1/YuqTFsGwqTsKPDrNZETwOpvCf4KHaKO6nm3gN7UL+pTi8MEk8ViAtP6t1tgn8+HrFSGgciA8+FYFbOLIwOXAYKdsU+NdJZSBLUkV9BQtmbb1aLu1v0mckrKiqDnn78Bzwd2rc8q7yWLUdLI1vuv3KOXXgyo4YpY+taaBdby3oCv7UJ3nnzX+LyuuYr2ECCYiRQABXJdyqmG0SZMpe9zzNy9pxYi6FgxVei6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZ5Rf4F03Y0f5GNm5yaoPyCMufX8aJh8dBe8hg4gaqA=;
 b=Rby8pS6AOIMBwvMUkK9dDHjvE1Hga5dsdKCf4EyXNiNYsRWhSkI8bdw6I1JmCGJIh3+8/jQjY7KnUlWcSQTtWQ8c0NeTVHBSguGFZUNCfjXyYl/g3FSYlk3xD4uJ+YOkcXFexFDrxHM7ofyNK+VtgJhpH2H3EWshotCzy//i48mQTcoC4HgmlV4u60aP/fvPQmRaOlG3iYgqyOeRrubzlf6I0onY5DX1/E2DtJPIMujQEoCEn5yO6Cba7XVqCZAL+vx+VVBIODp5YyAKUuUZTNh3VZPyo5WUKBfcSOwZK0M/ZyDIdgvLJmI6jgc4CpsT3Z2xuYJvEicJTHNMDfVHgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZ5Rf4F03Y0f5GNm5yaoPyCMufX8aJh8dBe8hg4gaqA=;
 b=dknxAAkO7FiJeO8RyUrTfCqbDWgNUo7/xWweK+R0Xq/NYh4LSgE+BGrMdcAcW8D7faYymWr60SMCe1V+z+SAirT/nIwwhlmKI86zq64zZQ+ln7lzK8S6syrbs+MNhxRVamHz3QuS1/o9h+l6v/ftJwds+YwHyRRhTJzPqTC34gw=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MN0PR12MB5953.namprd12.prod.outlook.com (2603:10b6:208:37c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.15; Fri, 30 Jun
 2023 23:25:03 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::b1a4:d803:b2ff:cc6b%3]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 23:25:03 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ladislav Michl <oss-lists@triops.cz>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 09/11] usb: dwc3: dwc3-octeon: Convert to glue driver
Thread-Topic: [PATCH 09/11] usb: dwc3: dwc3-octeon: Convert to glue driver
Thread-Index: AQHZourErp1VrH7ibU+eCPGd88bJzK+kDlUA
Date:   Fri, 30 Jun 2023 23:25:03 +0000
Message-ID: <20230630232458.ancgo25xvodd4fob@synopsys.com>
References: <ZJC165p0Mj4jHcBh@lenoch> <ZJC3TpgZJ6HtknhY@lenoch>
In-Reply-To: <ZJC3TpgZJ6HtknhY@lenoch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MN0PR12MB5953:EE_
x-ms-office365-filtering-correlation-id: 827c7330-26e1-4db1-1977-08db79c13b26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vDUKCFef3h20cdrD0MOXOXELMG40fRy9R5ipLqgLO5laEx9SggOiGihDr6U3wH3c/KULbv28rqrGip3VMx8l+hNMhnF58Ja1KZCGWnIxHko+JrevHUKUEQYnbKDUKpvUzDIjFGJ/Ea0SUI/7BRCl5PWW9fHE3//wkO/yboMRtVlX8mNMK/3Dg4kBb8b9cUeiBz/jacbwbLYuFzNCpZOa2BXpUIT9ta/M3yh/2o4vqDnXXR5UTmIB4AVEYHx3+Ezb4sSDLBHnwKX+GLRb39XmRYspiueEXSQ04IfvMaHNc4IBEmH0PvmJIjGNq84yjMPu88USQ6GcxqYxsVP47r9s8lkwRQATnGnTLykTNBKUU0W2Qr4QvpCbPUp+DDZ2yijY0B5ESxsA/mryj6hftfNDpUbxnRJzBy/vvKoGgFrD11VwBORJh4ApZvYgrJUpjkW9QsE5zL+A+I8v1w66P0EKyDNXfP5ARnL/nOMeBEjGcD2lGx6nZrq7VmLFis9TblGFen8gaR5TeFrfp26k3t7tXUYhSJlhgCap2ZPbgj8lHesYjopmXR6hasjJHCRfXizPR6dxlGoNgNn74bglhT0U+dLwUWegpsqMRlcajUPrZ5AZP9m+FwaVqRX2AoXaPfcK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199021)(6486002)(38100700002)(71200400001)(2616005)(83380400001)(122000001)(6506007)(26005)(186003)(1076003)(6512007)(54906003)(86362001)(41300700001)(38070700005)(316002)(36756003)(2906002)(76116006)(66556008)(6916009)(66446008)(66946007)(64756008)(4326008)(66476007)(5660300002)(8676002)(8936002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1Ixa3Qvc1VaOVdwUDlTVklSeXRXeDRkUElrcks2cTNNR1FwdS9qQ3hjN01C?=
 =?utf-8?B?cFp5bllPRGNZQkV4L21PT0NrSFZ5LzRrdTd5ejg1R05lM2toK3BGUjJyT1l4?=
 =?utf-8?B?cDdwQXpjOEN3M0dTNEQ4KzlWNWQ3bTRMVGcrd3NjOGJJNEpxTHJRVXVvampX?=
 =?utf-8?B?WHMxZ1d0TldDZHJYUnpoMnhpNmNuOHVHOVBudWdoOVd0dUtOY0JNQ0xkdi95?=
 =?utf-8?B?QW5nNmhsRHBadkdQamczSmNhNk9Hd1ZnMnBLTndxZFhlc3ZTcXNSVG1waFY5?=
 =?utf-8?B?M2R1WXJuOXFKQVBpR05pam01Ri9tR0xXeVZZYjJjYWdpOUpaRS9KQ1hjVDJ2?=
 =?utf-8?B?ekNmeWJVR1pMRlNrOEFCTnVwZGpaMEs4UnNxL3VnYUFXTHk1R2dTaWRtU3hq?=
 =?utf-8?B?cjkrdjhTVDZRVXRobnhLYjdkakFEblQ4dytQTWFQUEFDNDBsMlJ0T1Eyclc2?=
 =?utf-8?B?dU9CU1k5dW1jWFdrbW9MZjVrcVdFTUozeG95SUJ3YXhUN3YxRHdoa3BPaCtB?=
 =?utf-8?B?NTRyWDZCcVJsMlB3aUtwdXcxcHJKUXR2Qm9CVFZnWmN2MTFOYlY0R2t0RktI?=
 =?utf-8?B?aVBoMyt6REZVN3Nqd1JzSTk5UVFJYkJTeThvT05RVkVnZnN0dVlZRi9nU0xj?=
 =?utf-8?B?Ky9JbjdWV2JLaDN2SGhDQ3lwYS9nTWE4Zy96dWNJSVZtNzd5ZmgwY1phZytF?=
 =?utf-8?B?QkJhN2lQcTk4NThYcXh2aC9ZM01mNW9nTTZUSkhCMjB4b2wyVXhiNlE5QzJC?=
 =?utf-8?B?aXNGdC9Jb2Q0T3JnTWQ3TVBhcG5BVmR2Rk9nT0JSSHpXdUJKcVBoNGZ4NnRy?=
 =?utf-8?B?OGFWU3lOU3QrdEFoUTc2Uk1NN25oVkk0NGVjSWhEV3V4aEEvTmVUa3hsNHpI?=
 =?utf-8?B?QWFDL25qQlp1ZWowTGhua0ovS1NQWWl0dE9OSkg5a0p3TEJ6S0ZxTnVpanla?=
 =?utf-8?B?dmVsTHVOMlM0ZjhuSC9TbXZjN0VTWis2NHhOL0MxMW4rQXh3Y1F1dEZHbXJV?=
 =?utf-8?B?Q2xUVHBXc05ZZi9NYzdDU3kxNDMrL1NHWVpMRU00a2txcXArVzZjc2dod3Bj?=
 =?utf-8?B?OXN0eHgzVnRmalJkZFRZVEoyS2UxQzkrTTVrai9JN0VFYjZqV2pjYWlBT3p5?=
 =?utf-8?B?UzYrRnFYYTF1ZWp6T1oxSlFacGNYWit6NW81cGNiTWJOd3hlRktPVWRYalI3?=
 =?utf-8?B?TVpWWCtXQnpuenRSbjhoK0xXb3Y1NzdoYldBQ0x6MFFSeTNOT1FWVDZiVVcz?=
 =?utf-8?B?Tjk4b2J2U1A5eUhXeGVZc3pUbXBGWnFRR3VaSkFjNC9VQS9OL3dpclB6QTRx?=
 =?utf-8?B?VEluYlVmVmJQbjZOVzhLMGYyVmhHMnpWaGNqZHpYUERFSTUwVm5Hc20rSEdl?=
 =?utf-8?B?aXNUby9OM0kzSmRVVG1Ib3RRSERhczJRQlEzeHJaTXZIbTFDZHBZcGZWTkhr?=
 =?utf-8?B?MHJ4SlhZbFRQVTdPSGhBaGRPaGFSQzlaTFFhTHFVMHZSUmVIaHY1ZnJQWmlL?=
 =?utf-8?B?dXBjOEtPWG1MTkVRQnhMWmNmUlJSWnZ6UGd2NFAwR0ZHNnZXSUlDeU5kSFRY?=
 =?utf-8?B?WHVQTlhnRWtkQWg2Wm92aXRidGgyenhnNkFpSjZIWkFkdnRCRFVabHBNZjRX?=
 =?utf-8?B?TU1BeXNGTU5JRUdqcUpPZi9JS3VOT201S3VGOXpZcnh5NGgydEtMa0ZSMW5p?=
 =?utf-8?B?RmxOS1Y3M1RYMXp1SnhmWmJ4NnJHeEdaRVQ1L0ozb1o0aVlhdlZYdHZKc2cw?=
 =?utf-8?B?S0Q3SUdZckcwVzVlU3ZUbzNQY205VUFxUHFTZjZsRnF0b29LYkp5dkZlcU93?=
 =?utf-8?B?MXRIZFk4ejFiSWpyRlFkcUs3ZEJGdEtqVFAvWDZ2bzFIUjBrYWpMZy83RXAr?=
 =?utf-8?B?ejRvUmVHRUZnTWU2ZzkxY3RxWFdLVThtd3ptMjR4TW1DdFNWUDF1RTBnaGY4?=
 =?utf-8?B?MkN3anB3b3N1dk1FSUp3UmRtMmIyK1c0NFRsekR6Y3RjcE5xTEF0YTVNK21o?=
 =?utf-8?B?OU5lbm5WMVo1alo4SXp5UkZRWkdlZUgyYllhRlZhc2FGUVg2Q09ZNTlHc3J4?=
 =?utf-8?B?ZjMrWGxXTWVUcWZVV1Q1VDhMVU5wcFdXU3ZRUlV6SlI0SFJKMXFMdG40Y3dQ?=
 =?utf-8?Q?2U6HeerU34a+AF3HB4TXxa0S/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3915FBDE68BCC84CA852A2DB2E7C4AF6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: LTVqpxX1O30L9+r1AZ6JYcHjfDYB6xqSGRkTx9RcSmhcSg/5cpF3caE7Qi24TiViOaNH5M03xQUSVeFeJe+sTwgZFx0QtuvG/seEJntyb9SEaRn+H61FAeNlK4sCAW9ZyguCkMJf4JioVzIJHi+K9CmFHaboC4ctp7xeJ18T7VBlfDPxXIGfnSObQnlvj8KXP+M0JnFyx/pHJYTGHj56eCfGor8gjg+1Ssdh0jUghkIcVuFt2diUTdA02MRsuDYn9vq0i9kIHSXao5JAlRvusIxg8nhQfNIZWOMetjJnYxGCb2/65qf1bQ7/BQMhmPi5Ik/Z/2qSGEWa9IaERDmcZf3gmZWSFjsYQCyJpNueDKSms3AE98TS3mhOysNMXMWdvU1aXhgbphiG3UNusOC+b1B7UwVjR89Y9MkqleplmE7MWUHfhNeD/eNbJKayBBupJzbD+vHZ17+77eeuijBRxFxQvRo49y+IU/4mOXAAfMDRP4+kXwINFf0kX883k5PYDI14uiS3X13810b+ViiokbY09nHxL2jFGrU5TjiUb5Oou5NKM2Pw8+F6/oRhZwfiTvhiPzSvpr10kL64VbwIK8bvO8jOptqBrvXtl21LHF+QtIxDXm9NTA/+qoAGgRi2a66UTJChr59/FQDWNwAMCvaIvEdwRF3w1Pu8DbBppKW+B43dRg/yJVFIEsNh1r25rkBLhRo27U/12B+VEdqXMU2gFD8JLgAwOsNfMou/kfISYdrq51II3DuNd0ZXnBAK/X2ZwxYlMM8gqmI3U6XJLlG0MTOO02eCC/YX9pp+bTcj1v6xfkovXVh+t+Ouy51wBYF2FIxWe5DVbv9Ec5M00w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 827c7330-26e1-4db1-1977-08db79c13b26
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2023 23:25:03.0484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 70myOY6OyZsq/MevUV8XpUMTf5/+i+Z4TBDJTcCEX/F3FW+4mErBbCeXEceDu4ycRu4vwDw8jjtp9bX/xZKsIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5953
X-Proofpoint-GUID: BH14gh7jY-Qr4zR1UDB4lDOjwHoGfHPv
X-Proofpoint-ORIG-GUID: BH14gh7jY-Qr4zR1UDB4lDOjwHoGfHPv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_13,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 clxscore=1015 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306300206
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

T24gTW9uLCBKdW4gMTksIDIwMjMsIExhZGlzbGF2IE1pY2hsIHdyb3RlOg0KPiBGcm9tOiBMYWRp
c2xhdiBNaWNobCA8bGFkaXNAbGludXgtbWlwcy5vcmc+DQo+IA0KPiBVc2UgT2N0ZW9uIHNwZWNp
ZmljIERXQzMgZ2x1ZSBpbnN0ZWFkIG9mIGR3YzMtb2Ytc2ltcGxlLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogTGFkaXNsYXYgTWljaGwgPGxhZGlzQGxpbnV4LW1pcHMub3JnPg0KPiAtLS0NCj4gIGFy
Y2gvbWlwcy9jYXZpdW0tb2N0ZW9uL29jdGVvbi1wbGF0Zm9ybS5jIHwgICAxIC0NCj4gIGRyaXZl
cnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYyAgICAgICAgICAgIHwgMTAwICsrKysrKysrKysrLS0t
LS0tLS0tLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy1vZi1zaW1wbGUuYyAgICAgICAgIHwg
ICAxIC0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKSwgNTAgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2Nhdml1bS1vY3Rlb24vb2N0ZW9uLXBs
YXRmb3JtLmMgYi9hcmNoL21pcHMvY2F2aXVtLW9jdGVvbi9vY3Rlb24tcGxhdGZvcm0uYw0KPiBp
bmRleCBjZTA1YzBkZDNhY2QuLjIzNWM3N2NlN2IxOCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9taXBz
L2Nhdml1bS1vY3Rlb24vb2N0ZW9uLXBsYXRmb3JtLmMNCj4gKysrIGIvYXJjaC9taXBzL2Nhdml1
bS1vY3Rlb24vb2N0ZW9uLXBsYXRmb3JtLmMNCj4gQEAgLTQ1MCw3ICs0NTAsNiBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBvY3Rlb25faWRzW10gX19pbml0Y29uc3QgPSB7DQo+
ICAJeyAuY29tcGF0aWJsZSA9ICJjYXZpdW0sb2N0ZW9uLTM4NjAtYm9vdGJ1cyIsIH0sDQo+ICAJ
eyAuY29tcGF0aWJsZSA9ICJjYXZpdW0sbWRpby1tdXgiLCB9LA0KPiAgCXsgLmNvbXBhdGlibGUg
PSAiZ3Bpby1sZWRzIiwgfSwNCj4gLQl7IC5jb21wYXRpYmxlID0gImNhdml1bSxvY3Rlb24tNzEz
MC11c2ItdWN0bCIsIH0sDQo+ICAJe30sDQo+ICB9Ow0KPiAgDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9uLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2N0ZW9u
LmMNCj4gaW5kZXggMmFkZDQzNWFkMDM4Li4zZWJjZjJhNjEyMzMgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvdXNiL2R3YzMvZHdjMy1vY3Rlb24uYw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3
YzMtb2N0ZW9uLmMNCj4gQEAgLTE4Nyw3ICsxODcsMTAgQEANCj4gICNkZWZpbmUgVVNCRFJEX1VD
VExfRUNDCQkJCTB4ZjANCj4gICNkZWZpbmUgVVNCRFJEX1VDVExfU1BBUkUxCQkJMHhmOA0KPiAg
DQo+IC1zdGF0aWMgREVGSU5FX01VVEVYKGR3YzNfb2N0ZW9uX2Nsb2Nrc19tdXRleCk7DQo+ICtz
dHJ1Y3QgZHdjM19kYXRhIHsNCj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXY7DQo+ICsJdm9pZCBfX2lv
bWVtICpiYXNlOw0KPiArfTsNCj4gIA0KPiAgI2lmZGVmIENPTkZJR19DQVZJVU1fT0NURU9OX1NP
Qw0KPiAgI2luY2x1ZGUgPGFzbS9vY3Rlb24vb2N0ZW9uLmg+DQo+IEBAIC00OTQsNTggKzQ5OSw1
NyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZHdjM19vY3Rlb25fcGh5X3Jlc2V0KHZvaWQgX19pb21l
bSAqYmFzZSkNCj4gIAlkd2MzX29jdGVvbl93cml0ZXEodWN0bF9jdGxfcmVnLCB2YWwpOw0KPiAg
fQ0KPiAgDQo+IC1zdGF0aWMgaW50IF9faW5pdCBkd2MzX29jdGVvbl9kZXZpY2VfaW5pdCh2b2lk
KQ0KPiArc3RhdGljIGludCBkd2MzX29jdGVvbl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiAgew0KPiAtCWNvbnN0IGNoYXIgY29tcGF0X25vZGVfbmFtZVtdID0gImNhdml1
bSxvY3Rlb24tNzEzMC11c2ItdWN0bCI7DQo+IC0Jc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
djsNCj4gLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGU7DQo+IC0Jc3RydWN0IHJlc291cmNlICpy
ZXM7DQo+IC0Jdm9pZCBfX2lvbWVtICpiYXNlOw0KPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZw
ZGV2LT5kZXY7DQo+ICsJc3RydWN0IGR3YzNfZGF0YSAqZGF0YTsNCj4gKwlpbnQgZXJyOw0KPiAg
DQo+IC0JLyoNCj4gLQkgKiBUaGVyZSBzaG91bGQgb25seSBiZSB0aHJlZSB1bml2ZXJzYWwgY29u
dHJvbGxlcnMsICJ1Y3RsIg0KPiAtCSAqIGluIHRoZSBkZXZpY2UgdHJlZS4gVHdvIFVTQiBhbmQg
YSBTQVRBLCB3aGljaCB3ZSBpZ25vcmUuDQo+IC0JICovDQo+IC0Jbm9kZSA9IE5VTEw7DQo+IC0J
ZG8gew0KPiAtCQlub2RlID0gb2ZfZmluZF9ub2RlX2J5X25hbWUobm9kZSwgInVjdGwiKTsNCj4g
LQkJaWYgKCFub2RlKQ0KPiAtCQkJcmV0dXJuIC1FTk9ERVY7DQo+IC0NCj4gLQkJaWYgKG9mX2Rl
dmljZV9pc19jb21wYXRpYmxlKG5vZGUsIGNvbXBhdF9ub2RlX25hbWUpKSB7DQo+IC0JCQlwZGV2
ID0gb2ZfZmluZF9kZXZpY2VfYnlfbm9kZShub2RlKTsNCj4gLQkJCWlmICghcGRldikNCj4gLQkJ
CQlyZXR1cm4gLUVOT0RFVjsNCj4gLQ0KPiAtCQkJLyoNCj4gLQkJCSAqIFRoZSBjb2RlIGJlbG93
IG1hcHMgaW4gdGhlIHJlZ2lzdGVycyBuZWNlc3NhcnkgZm9yDQo+IC0JCQkgKiBzZXR0aW5nIHVw
IHRoZSBjbG9ja3MgYW5kIHJlc2V0aW5nIFBIWXMuIFdlIG11c3QNCj4gLQkJCSAqIHJlbGVhc2Ug
dGhlIHJlc291cmNlcyBzbyB0aGUgZHdjMyBzdWJzeXN0ZW0gZG9lc24ndA0KPiAtCQkJICoga25v
dyB0aGUgZGlmZmVyZW5jZS4NCj4gLQkJCSAqLw0KPiAtCQkJYmFzZSA9IGRldm1fcGxhdGZvcm1f
Z2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDAsICZyZXMpOw0KPiAtCQkJaWYgKElTX0VS
UihiYXNlKSkgew0KPiAtCQkJCXB1dF9kZXZpY2UoJnBkZXYtPmRldik7DQo+IC0JCQkJcmV0dXJu
IFBUUl9FUlIoYmFzZSk7DQo+IC0JCQl9DQo+ICsJZGF0YSA9IGRldm1fa3phbGxvYyhkZXYsIHNp
emVvZigqZGF0YSksIEdGUF9LRVJORUwpOw0KPiArCWlmICghZGF0YSkNCj4gKwkJcmV0dXJuIC1F
Tk9NRU07DQo+ICANCj4gLQkJCW11dGV4X2xvY2soJmR3YzNfb2N0ZW9uX2Nsb2Nrc19tdXRleCk7
DQo+IC0JCQlpZiAoZHdjM19vY3Rlb25fY2xvY2tzX3N0YXJ0KCZwZGV2LT5kZXYsIGJhc2UpID09
IDApDQo+IC0JCQkJZGV2X2luZm8oJnBkZXYtPmRldiwgImNsb2NrcyBpbml0aWFsaXplZC5cbiIp
Ow0KPiAtCQkJZHdjM19vY3Rlb25fc2V0X2VuZGlhbl9tb2RlKGJhc2UpOw0KPiAtCQkJZHdjM19v
Y3Rlb25fcGh5X3Jlc2V0KGJhc2UpOw0KPiAtCQkJbXV0ZXhfdW5sb2NrKCZkd2MzX29jdGVvbl9j
bG9ja3NfbXV0ZXgpOw0KPiAtCQkJZGV2bV9pb3VubWFwKCZwZGV2LT5kZXYsIGJhc2UpOw0KPiAt
CQkJZGV2bV9yZWxlYXNlX21lbV9yZWdpb24oJnBkZXYtPmRldiwgcmVzLT5zdGFydCwNCj4gLQkJ
CQkJCXJlc291cmNlX3NpemUocmVzKSk7DQo+IC0JCQlwdXRfZGV2aWNlKCZwZGV2LT5kZXYpOw0K
PiAtCQl9DQo+IC0JfSB3aGlsZSAobm9kZSAhPSBOVUxMKTsNCj4gKwlkYXRhLT5kZXYgPSBkZXY7
DQoNClNldCBwcml2YXRlIGRhdGEgYXQgdGhlIGVuZCBvZiB0aGlzIHByb2JlIGZ1bmN0aW9uLg0K
DQo+ICsJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgZGF0YSk7DQoNCj4gIA0KPiAtCXJldHVy
biAwOw0KPiArCWRhdGEtPmJhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRl
diwgMCk7DQo+ICsJaWYgKElTX0VSUihkYXRhLT5iYXNlKSkNCj4gKwkJcmV0dXJuIFBUUl9FUlIo
ZGF0YS0+YmFzZSk7DQo+ICsNCj4gKwllcnIgPSBkd2MzX29jdGVvbl9jbG9ja3Nfc3RhcnQoZGV2
LCBkYXRhLT5iYXNlKTsNCj4gKwlpZiAoZXJyKQ0KPiArCQlyZXR1cm4gZXJyOw0KPiArDQo+ICsJ
ZHdjM19vY3Rlb25fc2V0X2VuZGlhbl9tb2RlKGRhdGEtPmJhc2UpOw0KPiArCWR3YzNfb2N0ZW9u
X3BoeV9yZXNldChkYXRhLT5iYXNlKTsNCj4gKw0KPiArCXJldHVybiBvZl9wbGF0Zm9ybV9wb3B1
bGF0ZShub2RlLCBOVUxMLCBOVUxMLCBkZXYpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBk
d2MzX29jdGVvbl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gK3sNCj4g
KwlzdHJ1Y3QgZHdjM19kYXRhICpkYXRhID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+
ICsNCj4gKwlvZl9wbGF0Zm9ybV9kZXBvcHVsYXRlKGRhdGEtPmRldik7DQoNCkNsZWFyIHByaXZh
dGUgZGF0YSBoZXJlOg0KCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIE5VTEwpOw0KDQo+ICB9
DQo+IC1kZXZpY2VfaW5pdGNhbGwoZHdjM19vY3Rlb25fZGV2aWNlX2luaXQpOw0KPiAgDQo+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkd2MzX29jdGVvbl9vZl9tYXRjaFtdID0g
ew0KPiArCXsgLmNvbXBhdGlibGUgPSAiY2F2aXVtLG9jdGVvbi03MTMwLXVzYi11Y3RsIiB9LA0K
PiArCXsgfSwNCj4gK307DQo+ICtNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkd2MzX29jdGVvbl9v
Zl9tYXRjaCk7DQo+ICsNCj4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGR3YzNfb2N0
ZW9uX2RyaXZlciA9IHsNCj4gKwkucHJvYmUJCT0gZHdjM19vY3Rlb25fcHJvYmUsDQo+ICsJLnJl
bW92ZV9uZXcJPSBkd2MzX29jdGVvbl9yZW1vdmUsDQo+ICsJLmRyaXZlcgkJPSB7DQo+ICsJCS5u
YW1lCT0gImR3YzMtb2N0ZW9uIiwNCj4gKwkJLm9mX21hdGNoX3RhYmxlID0gZHdjM19vY3Rlb25f
b2ZfbWF0Y2gsDQo+ICsJfSwNCj4gK307DQo+ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVyKGR3YzNf
b2N0ZW9uX2RyaXZlcik7DQo+ICsNCj4gK01PRFVMRV9BTElBUygicGxhdGZvcm06ZHdjMy1vY3Rl
b24iKTsNCj4gIE1PRFVMRV9BVVRIT1IoIkRhdmlkIERhbmV5IDxkYXZpZC5kYW5leUBjYXZpdW0u
Y29tPiIpOw0KPiAgTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOw0KPiAtTU9EVUxFX0RFU0NSSVBUSU9O
KCJVU0IgZHJpdmVyIGZvciBPQ1RFT04gSUlJIFNvQyIpOw0KPiArTU9EVUxFX0RFU0NSSVBUSU9O
KCJEZXNpZ25XYXJlIFVTQjMgT0NURU9OIElJSSBHbHVlIExheWVyIik7DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2Ytc2ltcGxlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3
YzMtb2Ytc2ltcGxlLmMNCj4gaW5kZXggNzFmZDYyMGM1MTYxLi5lMzQyM2ZiZWEzZWQgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vZi1zaW1wbGUuYw0KPiArKysgYi9kcml2
ZXJzL3VzYi9kd2MzL2R3YzMtb2Ytc2ltcGxlLmMNCj4gQEAgLTE3Miw3ICsxNzIsNiBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgZHdjM19vZl9zaW1wbGVfZGV2X3BtX29wcyA9IHsN
Cj4gIA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgb2ZfZHdjM19zaW1wbGVf
bWF0Y2hbXSA9IHsNCj4gIAl7IC5jb21wYXRpYmxlID0gInJvY2tjaGlwLHJrMzM5OS1kd2MzIiB9
LA0KPiAtCXsgLmNvbXBhdGlibGUgPSAiY2F2aXVtLG9jdGVvbi03MTMwLXVzYi11Y3RsIiB9LA0K
PiAgCXsgLmNvbXBhdGlibGUgPSAic3ByZCxzYzk4NjAtZHdjMyIgfSwNCj4gIAl7IC5jb21wYXRp
YmxlID0gImFsbHdpbm5lcixzdW41MGktaDYtZHdjMyIgfSwNCj4gIAl7IC5jb21wYXRpYmxlID0g
Imhpc2lsaWNvbixoaTM2NzAtZHdjMyIgfSwNCj4gLS0gDQo+IDIuMzkuMg0KPiANCg0KQlIsDQpU
aGluaA==

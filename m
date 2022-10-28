Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4AC610C96
	for <lists+linux-mips@lfdr.de>; Fri, 28 Oct 2022 11:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbiJ1JAd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 28 Oct 2022 05:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiJ1JAa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Oct 2022 05:00:30 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11hn2228.outbound.protection.outlook.com [52.100.173.228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E93CC34C8
        for <linux-mips@vger.kernel.org>; Fri, 28 Oct 2022 02:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFp4OYapaF9UGNXCqS0QezYLlP3bMtc95XsqRpyrgnkHmg0OsCV1ECBpPAuhQxoVXSXCIDU+7a0GF977OV4xqvxpwhB8gXtUuQTezy4cv3WPyRgLqwq9XhBnvt0v17WpxzDWXMvdWQHdwYZjbWTh6Q5h0zoHBXA3sxrAVAG65okCoyaUzFwDRfQI5eVcP//m6FtGoAK4CVEQm0dujh6a+FCFI3vhvDbm54zyvv/2T+86DD0nL0e9EqFeASY+XPPslvLzWZqVSzIwgBeQiF7knz+KCDfA6vCMw7AIDpZv5fEDqk011vaMbLwvN7D8cHcr1bfkKdDHR09PENj2LMbaEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71b8Hcq0jbWLm9Mr1IJyvq/N3UExkjznuA19heg3urU=;
 b=KCc/RaMhxe1bscyFehOLMwRrucwHv2XR20nWT2U5xCOahxL04/9QV66+2Obf5+PvygBEpX4ohttRebrQoPmFRaboxW2D1VJ//g72EgNKddUv37NoOKny/19IY+FnhtZVdkUVMY3TMrDHvcyrqW8btW2xOwiJ0qak5y4RKCy/X6K8PhSXogg5zRIIDuoovEwuCGS8Iu0Ahz8jY0QQlOmw2kvTHdV6rxWGn1cKkyFb8+9c3/uF5B8idueTBGRnUzwdrtUTRhOkJdTnBGNgfeLvIj7N/y4Izak7IpzfSEy/NilJEFfb0KDetHpkvPInMr+f6u2oWqOZIeBuZOivnsTLUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 209.184.167.3) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=sheldonisd.com; dmarc=none action=none
 header.from=sheldonisd.com; dkim=none (message not signed); arc=none
Received: from MW4PR03CA0111.namprd03.prod.outlook.com (2603:10b6:303:b7::26)
 by CY4PR15MB1735.namprd15.prod.outlook.com (2603:10b6:910:23::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Fri, 28 Oct
 2022 09:00:28 +0000
Received: from MW2NAM12FT092.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::8b) by MW4PR03CA0111.outlook.office365.com
 (2603:10b6:303:b7::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.29 via Frontend
 Transport; Fri, 28 Oct 2022 09:00:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 209.184.167.3) smtp.mailfrom=sheldonisd.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sheldonisd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 sheldonisd.com discourages use of 209.184.167.3 as permitted sender)
Received: from mail.sheldonisd.com (209.184.167.3) by
 MW2NAM12FT092.mail.protection.outlook.com (10.13.181.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5791.9 via Frontend Transport; Fri, 28 Oct 2022 09:00:27 +0000
Received: from MAIL-365.ad.sheldonisd.com (10.1.16.82) by
 MAIL-365.ad.sheldonisd.com (10.1.16.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 28 Oct 2022 03:59:43 -0500
Received: from [193.47.61.101] (193.47.61.101) by MAIL-365.ad.sheldonisd.com
 (10.1.16.82) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Fri, 28 Oct 2022 03:59:43 -0500
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Description: Mail message body
Subject: [EXTERNAL EMAIL - USE CAUTION] Greetings!   
To:     <linux-mips@vger.kernel.org>
From:   "Mr. Paul Morgan" <wendyarandas@sheldonisd.com>
Date:   Fri, 28 Oct 2022 10:59:42 +0200
Reply-To: <paulmorgan5377@gmail.com>
Message-ID: <f1c5012d-15d5-4a54-bf96-c51211c491a7@MAIL-365.ad.sheldonisd.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2NAM12FT092:EE_|CY4PR15MB1735:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7b6a30-7fa5-4ae6-c9bb-08dab8c2dc1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3+9UNHQ0yxYEuKqQzph5QTkeallZgTmAgAL7LLsDGmhBVUNWegvFwNhMF5?=
 =?iso-8859-1?Q?yUjwOwViAhXOqvJKmgT4clxBWvONjNc1Ci47HLgd5pj7RisQGzSjFQzVZf?=
 =?iso-8859-1?Q?kUwJfUuTfTq/TjQwF7y2Z87c6uCyK/BwrEjw0yfU/vKtuU6zav2hOX29rH?=
 =?iso-8859-1?Q?WwLA8vs/LbEaT2Qjqrg2aZJW+YduvcDvLm9IxmkENRQq7KwOQz7WJdFGEU?=
 =?iso-8859-1?Q?bl2w3sC8nlXMUOlDIICclOWRg7rhFZ1aEDF1n/VjOe7FdMN9OF0I6Vb3uh?=
 =?iso-8859-1?Q?z50UWMTPze8+ADW8j+L96YlfZ3na98jY3nuHaOvKM/f90bhfrJAEg6DqBr?=
 =?iso-8859-1?Q?0UiNQHkEegDi0RewFJ7EkFCZSNqeJPyoHdUgYYwRnASDEhdEdkIsWKh1/c?=
 =?iso-8859-1?Q?f7iwulL04iKztMO+1rU+k/kY3XV4pJrclf1u39Ue9voSpez4HKGQFbq3t2?=
 =?iso-8859-1?Q?pP6xbvKz97yKLbJQxk86B5hZWpToD3IbnXba24S1S5cmpb+SvOp1u+nwnR?=
 =?iso-8859-1?Q?LmOdrHNJG9JIbTIrTrBAaD6vXHMgP3P9rYvdK5Jp2nC28Ozj6L6UfTpWNd?=
 =?iso-8859-1?Q?K/KM2dEy3PsinkpX2CrYwxhaiLrvoQsKtYcZVimJVNeHIWdFCJRruops90?=
 =?iso-8859-1?Q?pJPSo2H18INXw+owvMaK3BuWpRI2P8Lw75KEhI3tEGpn2uiSJsJ5vOoDIU?=
 =?iso-8859-1?Q?g7ovtV6GTKH8cGPGuMX4uF16ZiICLrGVqibBzJFBTudJLZvtIDDrTrbHEA?=
 =?iso-8859-1?Q?DmtGLZl89aYrM6JIEFfOraugcMENI5DrJtTh/viGQAP5F70NHr3o+dIUja?=
 =?iso-8859-1?Q?21//9oRxX1vodFl3Qe4oguUmKF3VSMRJj7QCqjP5Ufkrqs095i6ttZCafV?=
 =?iso-8859-1?Q?P1az7zSqpb4+VvRGUPUvpg94p6mWLLFufGR7IsIME6VHHHgZsPwFWmM0PQ?=
 =?iso-8859-1?Q?DxENMIik54rDwuU1aOsTQeW2mq95W1DN7hPb7AoUfT2xijdNfEe5Xd0ojo?=
 =?iso-8859-1?Q?zUdDA1vQXRiR4AL4ye9eqYOBnj5Jg16sWDWdS+x5zAJFVHJPyNykmmPFQb?=
 =?iso-8859-1?Q?OFObUSunqWAT41x9fPN3UxtubR6LH+4Y84KMRHzGtTLRQq7jaSU+xoRDKv?=
 =?iso-8859-1?Q?VN5xMyrif5UfMgUkEmM7+fNnH4ilXncqG2LTTjD/8e5whX3cy0d6BAFyty?=
 =?iso-8859-1?Q?Lx6y/0dMwSuHQf4Otuz5uoOIBjd4E5SNGLgJhCmXvkzTeUC05Amdd/dv?=
X-Forefront-Antispam-Report: CIP:209.184.167.3;CTRY:US;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:mail.sheldonisd.com;PTR:mail.sheldonisd.com;CAT:OSPM;SFS:(13230022)(346002)(376002)(39860400002)(136003)(396003)(451199015)(40470700004)(36840700001)(46966006)(40480700001)(478600001)(70586007)(6916009)(16576012)(786003)(2860700004)(316002)(31696002)(40460700003)(70206006)(41320700001)(82310400005)(8676002)(6706004)(26005)(83170400001)(2906002)(186003)(956004)(336012)(42882007)(7596003)(82740400003)(356005)(41300700001)(7636003)(36860700001)(4744005)(5660300002)(31686004)(426003)(47076005)(8936002)(83380400001)(16900700008);DIR:OUT;SFP:1501;
X-OriginatorOrg: sheldonisd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 09:00:27.9756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7b6a30-7fa5-4ae6-c9bb-08dab8c2dc1a
X-MS-Exchange-CrossTenant-Id: 3237ab13-a154-4aab-bc15-73e6206d6acc
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3237ab13-a154-4aab-bc15-73e6206d6acc;Ip=[209.184.167.3];Helo=[mail.sheldonisd.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT092.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1735
X-Spam-Status: No, score=1.3 required=5.0 tests=BAYES_50,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,
        SPF_PASS,T_HK_NAME_FM_MR_MRS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CAUTION: This email originated from outside of the organization. DO NOT click links, provide credentials or open attachments unless you validate the sender and know the content is safe.

Good day,

I would like to get in touch with you.
Please advise if I am contacting the right person.

Sincerely,

Mr. Paul Morgan.

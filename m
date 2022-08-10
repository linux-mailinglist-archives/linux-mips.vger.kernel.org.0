Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB5358E76C
	for <lists+linux-mips@lfdr.de>; Wed, 10 Aug 2022 08:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbiHJGwb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Aug 2022 02:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbiHJGwb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Aug 2022 02:52:31 -0400
X-Greylist: delayed 4053 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 09 Aug 2022 23:52:28 PDT
Received: from bk-medien.net (bk-medien.net [164.132.13.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91A871BEB
        for <linux-mips@vger.kernel.org>; Tue,  9 Aug 2022 23:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=bk-medien.net; s=default; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:From:Date:Subject:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=NSDYXwnBrVI21aycI4zRjljbAqjziR93MV0ht6OxBVk=; b=GCJSRoem1w+iBDpEopFhycjVjJ
        bBhHVAzbtLyCOSszKXGCDix+GugdCM5wK6OYeL/iZgVwpfLGcz+B7p8yJbaoit7B7A+lWnmbj0GEo
        AJuvWe8CAibDSuPQv5hvxeCYXn810afQZmbxVWlK7WvGuseRicOXcSPxnxhH5tL2LTmZd4KrSDzZt
        P2NvEO0zSOgH3alGMaocyguPmbBknAiU7yl+0zw60PF9f7n2/Z1gXyS8G8a6XdHegLsyYyGcvPZAh
        7Zo2EvmqFmrxqmiHE+8kKvXU32Nq2muEw0lIkJHfPTGFvcmftTMCMtwb1nLKqAlzV0W/W87LUSmZb
        zKU+q8zw==;
Received: from xxxedien by whm02.nmkr-hosting.at with local (Exim 4.95)
        (envelope-from <xxxedien@whm02.nmkr-hosting.at>)
        id 1oLeWT-0006ZB-VN
        for linux-mips@vger.kernel.org;
        Wed, 10 Aug 2022 05:44:54 +0000
To:     linux-mips@vger.kernel.org
Subject: =?us-ascii?Q?Der_Ruckgang_der_Kryptowahrung_macht_Sie_zum_Mi?=  =?us-ascii?Q?lliardar?=
X-PHP-Script: bk-medien.net/index.php for 156.146.63.147
X-PHP-Originating-Script: 1016:PHPMailer.php
Date:   Wed, 10 Aug 2022 05:44:53 +0000
From:   CharlesSap <linux-mips@vger.kernel.org>
Message-ID: <yFfMjK5EEtEvz1Q72mT0LLIXX96qzYS0ZaJLg4@bk-medien.net>
X-Mailer: PHPMailer 6.5.3 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm02.nmkr-hosting.at
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [1016 993] / [47 12]
X-AntiAbuse: Sender Address Domain - whm02.nmkr-hosting.at
X-Get-Message-Sender-Via: whm02.nmkr-hosting.at: authenticated_id: xxxedien/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: whm02.nmkr-hosting.at: xxxedien
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Status: Yes, score=6.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,PHP_SCRIPT,
        RCVD_IN_VALIDITY_RPBL,SCC_BODY_URI_ONLY,SPF_HELO_PASS,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  1.3 RCVD_IN_VALIDITY_RPBL RBL: Relay in Validity RPBL,
        *      https://senderscore.org/blocklistlookup/
        *      [164.132.13.169 listed in bl.score.senderscore.com]
        *  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
        *      mail domains are different
        * -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
        *  0.7 SPF_SOFTFAIL SPF: sender does not match SPF record (softfail)
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  2.3 PHP_SCRIPT Sent by PHP script
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  1.3 SCC_BODY_URI_ONLY No description available.
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Message Body:
DIE WELTFINANZKRISE KANN SIE SEHR REICH MACHEN! https://telegra.ph/Passives-Einkommen-und-7500000-Euro-auf-KryptowГ¤hrung-870034-08-09


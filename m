Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31E0278B83F
	for <lists+linux-mips@lfdr.de>; Mon, 28 Aug 2023 21:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbjH1T0V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Aug 2023 15:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233088AbjH1TZ6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Aug 2023 15:25:58 -0400
X-Greylist: delayed 902 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 28 Aug 2023 12:25:53 PDT
Received: from symantec.comsats.net.pk (symantec.comsats.net.pk [210.56.11.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E359D107
        for <linux-mips@vger.kernel.org>; Mon, 28 Aug 2023 12:25:53 -0700 (PDT)
X-AuditID: d2380b23-3c1ff70000007104-12-64ecf1389373
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 36.C7.28932.831FCE46; Tue, 29 Aug 2023 00:10:48 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=KuuYPS4GT02To57BktMwoI7ROd03t1WTvgc+B3JM8eTSNw2A4EcR53LrLETbwipHX
          rXUt9I4UCBoRAxRACrA9k+vQKiruuWFqlsGVGBRhcHQn8kAh0bDY0az/2Sc2xpHZC
          1HUeepnJudiBRLMLVx3Ps22HEUL8z08rSUpQnC+1o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=olmk80cLmZoXHNEULi94oyNYNSuJDPnVFjLFsR7WPgY=;
        b=hsKKJFh0fi/rqTdHx+qxV5L5RhfVcWS+iBW/ckS+TNpaMMP9UPBmBHmvYE5DpMvRq
          6ZJOnNRT+//uVP7xWv0L3Vn2Y51PHLBs0w3NylRB9dvimopl8irt/2lMru1KTLsDM
          1xoO9ZWW53E1SAjHjpVNoszGm7Fo3j2c7XmeiSpz8=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Mon, 28 Aug 2023 23:58:45 +0500
Message-ID: <36.C7.28932.831FCE46@symantec.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Thanks for your response!
To:     linux-mips@vger.kernel.org
From:   "Hou Qijun" <conference@iesco.com.pk>
Date:   Mon, 28 Aug 2023 11:59:06 -0700
Reply-To: qijunhou02@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0wTZxjH8/aucNLePI5fj4Wx5BYxcRnOhSyNLvuVZRqROZMtTBPXnfSg
        hNJ2vYPJsiWFmQjNcG4prJapRZhxg0RXMqYzOFaFKcFsVtkWmZi5AmvLQEVC1TD2Xn/Q++fN
        e5/n+T7P932f9yiCvUbpqGqLJNgtvJlLyyAD+gLN0/q7M8Znmubz9C2+79BLaOu8r/ANtDvj
        eaNgrq4X7BteeDfDdNUZTLedI/Z5Dp9Md6CgyolWUcCUQMRzI92JMiiWOacCR88FJH+QTA8B
        N4+dVsc//iLgeOttIp72McJpY0jW08wmWLjboZb3BFMMf7S50uI8Ey4fDpJx/hSc6IxgMYX3
        RbDglGScxXCwNLQUS89mCqFlaSBWJg2n93nvkHI6yayFM/9tk7csTvm5v/4QWu1R9PIoenkU
        vTypXl5EfoPyxIZaHl9aRXGFtVbkJbHYIkjFthofit2g5skzqOuQwY8YCnFautkxY2TVfD0W
        +VEppeJy6PFGjB7bazU2mHjRZLDXmQWRy6Y3hTGmV/DeOnMNp6MLfsc0a4VahPdFsyDhkfkR
        UASWBV4OY5mRb/hAsFvjxfwonyK5PLqgaKqCZap4SagRBJtgT0bfpCgO6K9DuHKmXagS9lVW
        m6VkGOsGSyNGllFGYmYep3dl4l65yoDSj4pa5UdbKS02tWNSPoto42vF6qpE3aw41SZprOYa
        uucahmwSpuqNICt19OCPAwTVPDuK14V+5yDBkharRdDl0ftnsYqRVaY6y4p3XS49PIQtrlYE
        5Da6Avq8zHMUPNUp+fLDKIrwzLLonDnZJ/4xUuZZ+soNDDUJGPMO9HMR+QoTLFXw2dO4DtOr
        gonhcrjk9ajhon88DaKDyxT0NT3SQu+pe7kw63UD9PaGAMbOjm6E65M3SyDY+WAzfPnThS2w
        7Ahsg4Xmqe3ge+TaAQdHh96Ck02hSghH7ttgYrC1HtxR10fgvtOP/6HP2udaELQdGf4Ewa3R
        X1sRXJ9zf4rg35G2zxHML5//AsHib8N4vd3p7kBw/MHAEQSBsYmjeP2hrxuF8eBUeHCu7+XX
        JEq8pBycZiAsDy5BE4NTy5BNwtTpdQ7kn3m9aOeuU4Wmsq4rTS9eFuvana+uG9f0rX9YFpps
        eCWYvycU6J4StNPtVZFoz7q27vxblWPvNG7Ovzp/bETlXOP7yvVP9In3fjmw21Be4v+bPNBY
        To3suVjqPnFvcYPe9uHOtwOL0/qyxv2v/Tl9ttIQ8fZvyTZcsm9/eL/r247IWhtHiiZ+43rC
        LvL/A1txx3LmBAAA
X-Spam-Status: Yes, score=6.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [210.56.11.35 listed in list.dnswl.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [qijunhou02[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thanks for your response,


Kindly reconfirm your interest to further discuss the investment Thanks for=
 your response,


partnership within your country as I explained earlier so we can have a fur=
ther discussion to facilitate the process for mutual interest.

Looking forward to your response.

Hou Qijun
Vice President- CNPC
China National Petroleum Corporation
No. 9 Dongzhimen North Street Dongcheng District Beijing.


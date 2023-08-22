Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53AE8784F3D
	for <lists+linux-mips@lfdr.de>; Wed, 23 Aug 2023 05:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbjHWD0Q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Aug 2023 23:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbjHWD0Q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Aug 2023 23:26:16 -0400
X-Greylist: delayed 903 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 20:26:10 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC91CD6
        for <linux-mips@vger.kernel.org>; Tue, 22 Aug 2023 20:26:10 -0700 (PDT)
X-AuditID: cb7c291e-055ff70000002aeb-74-64e563e37e64
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id C1.1D.10987.3E365E46; Wed, 23 Aug 2023 06:41:55 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=mz+qxg2RadGBv033mnsFTWmF1R1JFD6tZR3JR4286KtZUc3jiTPEY6eXrCE1bpxlf
          5UQ5uW9MVUU73GHobj6612HHOjPguzmi6w0XlZrGq6Eo7kq8NUILdf5g1AOEzBntn
          TNFOgj0ITDX+GpHh1ohCEzB8mDvTKvQIifYdIcZ6w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=lMrxP5p+tSY5uoZAY6NkZ89QDLkiRKgqm7qrdGX9M0N6x5WLJPOvICfRLAZSPtpAI
          esYDSslhoKNr8I2mfb4mqDUCc81imnReUr5Z8R7EijzoU2JMaaXrgV/wJ49AVgFHP
          /e6tQ2H23TujVsmR9dU9Fc1ZqE6vF58UsPg7slTgM=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:03 +0500
Message-ID: <C1.1D.10987.3E365E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-mips@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:17 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLLMWRmVeSWpSXmKPExsVyyUKGW/dx8tMUg3MPxCw6N21ldGD0+LxJ
        LoAxissmJTUnsyy1SN8ugStjyboLLAW7mSva+hexNDA+Zupi5OSQEDCRuN48jbWLkYtDSGAP
        k8TMk/0sIA6LwGpmid8zz7NBOA+ZJQ5snswGUdbMKLH230ewfl4Ba4kFb9ayg9jMAnoSN6ZO
        YYOIC0qcnPmEBSKuLbFs4WvmLkYOIFtN4mtXCUhYWEBM4tO0ZWCtIgJyEp1/97KC2GwC+hIr
        vjYzgtgsAqoSBze9B4sLCUhJbLyynm0CI/8sJNtmIdk2C8m2WQjbFjCyrGKUKK7MTQQGW7KJ
        XnJ+bnFiSbFeXmqJXkH2JkZgIJ6u0ZTbwbj0UuIhRgEORiUe3p/rnqQIsSaWAXUdYpTgYFYS
        4ZX+/jBFiDclsbIqtSg/vqg0J7X4EKM0B4uSOK+t0LNkIYH0xJLU7NTUgtQimCwTB6dUA2Nq
        +ffjr672e6Q0Nk0SdDFTLZ3IPzN39gSH00uu9GbyHJFve/ZrVYHnOguX42ucM/z/1CiszWg9
        JFy9q5qlS0olOParwqWVJ5QcOVqKfA4fnVex8YMns4zDU1GN2VbFVr1Tz8Sfe2l/g2ci89Hl
        9a2NMzwy519xMRZsO/awTKJiEo9+55ovE5VYijMSDbWYi4oTAWD2frFAAgAA
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China


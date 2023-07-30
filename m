Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8877686C9
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jul 2023 19:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjG3Rgx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 Jul 2023 13:36:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjG3Rgw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 30 Jul 2023 13:36:52 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB72490
        for <linux-mips@vger.kernel.org>; Sun, 30 Jul 2023 10:36:50 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b933bbd3eeso55253731fa.1
        for <linux-mips@vger.kernel.org>; Sun, 30 Jul 2023 10:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690738609; x=1691343409;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8EJGgzQqutJFDlzcKppgukpynrnTTIYEegbSwRHtF+g=;
        b=dwlur2vcNk+3lQbYsHR8idChosu1y732RAlIpWVi2Gi3ltkSqq84OlhNlAyOlhOCzn
         XzfGKbht41Zu6/j9l1ihwpokKwxeNpKuou5cREB/l8+0W7xO3F1l1r68Lozr+jezR493
         ndhSNksE08NDXp8aQbo+/VPYsj7cOPCMufduk7XYoPIozd2B6aC22QvWbaVaOV0H5XdF
         NmSrLL9yk3jB6Q2D2IF+8ODl66GKmsTVXH73J2du/brT05gU/p1NjCiW1TMGlfRyZrPN
         Dqyx6zXWTLg0YBWCxwhMl61GXUyw1vO185r5mYwmRNyTO+PTIT6iEJSs0PeKnJZwxk9s
         NewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690738609; x=1691343409;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8EJGgzQqutJFDlzcKppgukpynrnTTIYEegbSwRHtF+g=;
        b=ag+ILWZHOtxxpV2r5izgjMqBI/2Z0eiPUaWrMzw8R6vsuTJDEAAE8xjzIFWIb9Z3rs
         rYznTWQqS3K0+RGvAL3UIY5dEbKckIFu+WnHPt2/pPiBaOiHZNiKL1MEHHpvFmIjfyXh
         4RQAsC9TQL9Uq/SHhjE0G3K1p0ZbjVqgmRqYT3XvnRZ66KIXp+ai9lpJyfDCnU1sggBn
         qljM4r0vMYYImrcJwzabJ75gOgHk3i184X3kc/coysiTFYYWfscOFkNxBV4SwI+K5Zyu
         FEfFx3PGhYF9gJD2YSgVYKp4WVEFuRT2w5zIZaiqcVog7HKcPMbgeTdTRsETw57XEAYL
         obNA==
X-Gm-Message-State: ABy/qLY+26WCvea7SNo9Jrb2SAcIh0YFnu3AlkOixEwUo9cGXjxXVSrO
        XDNfu00yvYo1R264/Fj3YMoLHX3iNJgOhEwcAvc=
X-Google-Smtp-Source: APBJJlFNq8w39Oiu+stRgSEVBSeXWmslJ2ZBZW0373IZUigP4IM+c/xMilssyj89v2nzXKrCRxrAII+oFkfrgogOSFw=
X-Received: by 2002:a2e:b6c2:0:b0:2b6:df25:1ab0 with SMTP id
 m2-20020a2eb6c2000000b002b6df251ab0mr5200834ljo.34.1690738608692; Sun, 30 Jul
 2023 10:36:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:82ca:0:b0:2b9:a622:1baf with HTTP; Sun, 30 Jul 2023
 10:36:48 -0700 (PDT)
Reply-To: fionahill142@gmail.com
From:   Fiona Hill <briandickson084@gmail.com>
Date:   Sun, 30 Jul 2023 17:36:48 +0000
Message-ID: <CAOUDwrAO7zUk1==3qAtP=udA2zDQ_PPMuCcAxMkDpPvH1dWfGQ@mail.gmail.com>
Subject: Hello, did you receive my email?
To:     fionahill142@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,BODY_SINGLE_WORD,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_BLOCKED,SCC_BODY_SINGLE_WORD,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

5L2g5aW977yM5L2g5pS25Yiw5oiR55qE6YKu5Lu25LqG5ZCX77yfDQo=

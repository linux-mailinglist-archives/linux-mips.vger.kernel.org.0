Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27CAF639CA3
	for <lists+linux-mips@lfdr.de>; Sun, 27 Nov 2022 20:54:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiK0Tyd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Nov 2022 14:54:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiK0Tyd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 27 Nov 2022 14:54:33 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5011FDF47
        for <linux-mips@vger.kernel.org>; Sun, 27 Nov 2022 11:54:32 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso7013496wmp.5
        for <linux-mips@vger.kernel.org>; Sun, 27 Nov 2022 11:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=biw1utCmNyI+ef9futimPqL2qrgw3YwY9eWMD1oBQZg=;
        b=jWtDu6/5Pw8zSEYXAZmHm3RV2+GlqZcAgMH5u+UlxPAf9FdRWTofEiI19z73ie01+S
         iAF9YvWWE5FTYbD06cDQNpp0+TmNtgPLgtPpzoVdSZfTTP1FIl3KrpPmiEMtFlLMc4RI
         ShJzd9ZDnz7YjctfIptcA9eiZ0ctRcUyKNTUWTsfMhqSd954wzVIi1NEeZJ7b22ee0eF
         XUWAAlFeVQt7OpsBduVM/m91ZIaviw63wXwx0YRKGH8tTOdRDtHSgYxzxJwcxsJ6B/jb
         ekndzNGmEPljKdf7j8FIB99yJyJRA+rxOhxSVDtBSy6B1KTEvVuu7xLfkdjneid5mA5F
         TQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=biw1utCmNyI+ef9futimPqL2qrgw3YwY9eWMD1oBQZg=;
        b=G/EOLPqgM+ubk/WM29QBJ88YKyyA4akSBHNfK1sGrAPLRVf6IcWzOmVEsMgrnHbqKw
         QrZzFOyrRe7UjPjHpz0gPnSJ/ZxoA/1kZaAm0R0TcwNfJRvKB3vSGGgcNORECVG0GIwm
         +oZrDJ/y7ughL9SAczLPdN22EnPTPGDBzSLjrLRLB9hjcAASW9WRupynjH0THxTMo1jw
         s5ZT7xTMPUOScaauIAuxZ3NUTLABxOZoSYQUL+bkijeXbNiHrDUp35e/8gcX/49bOO3o
         OOt0zTs+aB6fMSy8yg+gDnoLKbuFOdS8kqwI1CWwB1hvidNKyj+hiIGBU3Br9SsKwzc9
         abXw==
X-Gm-Message-State: ANoB5pmUoBaoNB6QxfpITCi39aoSbdhYyXUuKBQwNRWq+V4MUsxvPElY
        8oXioS5kTE6rKXSJYH++6vYtKA8Jnah/PUCQ0AC14eiWyCgLKVJr
X-Google-Smtp-Source: AA0mqf4EZXdLeJN7qlglF41+P7Szgm3mREdfcAq7l5ycYsEE6gW1TMMDf6iRppYiT4XeoUvtxRlI2hUz+1L9K+9Bq10=
X-Received: by 2002:a05:600c:210c:b0:3cf:6af4:c4fa with SMTP id
 u12-20020a05600c210c00b003cf6af4c4famr35972388wml.117.1669578870669; Sun, 27
 Nov 2022 11:54:30 -0800 (PST)
Received: from 332509754669 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 27 Nov 2022 13:54:30 -0600
From:   HAROLD COOPER <haroldcooper810@gmail.com>
Mime-Version: 1.0
Date:   Sun, 27 Nov 2022 13:54:30 -0600
Message-ID: <CA+0JWipp_rowkXC9v1xGXAmCVibRRDCcfk6t-gqo1W+RZYqxcg@mail.gmail.com>
Subject: HARD HAT
To:     linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

To whom it may concern,
I would like to order HARD HAT . I would be glad if you could email me
back with the types and pricing you carry at the moment .

Regards ,
Mr HAROLD COOPER
PH: 813 750 7707

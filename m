Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 713C74EDE94
	for <lists+linux-mips@lfdr.de>; Thu, 31 Mar 2022 18:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239775AbiCaQTX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 31 Mar 2022 12:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239762AbiCaQTV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 31 Mar 2022 12:19:21 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF6588EB6A
        for <linux-mips@vger.kernel.org>; Thu, 31 Mar 2022 09:17:33 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id i132-20020a1c3b8a000000b0038ce25c870dso2001571wma.1
        for <linux-mips@vger.kernel.org>; Thu, 31 Mar 2022 09:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=7p6hqD+u5H3FTZ/1NFMMfJSrultHsKQZRe7c2mrNd2I=;
        b=AuXTjTJazJO4wQ8cmvk56UzNyIpiYzpziT8XJlJZpzqemd/TrekrxcA4tJEBo4ulGh
         e00WeH2oMFPFciffpxyq4fpAMZsh0DrUt3y0D9sZI0dvajY9twINe7Pw5oKhx7BKmNrg
         h8Bx2QXdbc5oyDYk0iaBwgh1/y0XIUJ6Qqi7anp8Z0gY3PqzxcijdSsz/0LMS+WjBzEQ
         SQycidpbCR+0GBQFtFWpg0oNKssFnKX2h11CPH7vu90X0rGqF5xOOdsWoSC83kjuEUCZ
         sDnKqld2N7f9CHcfCSU8SYzQ6LvVmDZ4mTJq+R4etVzorYdFKOrfq99K0vd9o09I5ORr
         PqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=7p6hqD+u5H3FTZ/1NFMMfJSrultHsKQZRe7c2mrNd2I=;
        b=Z1bDCmPnQq2w6BAFm1woNv2wYkKBKntbGgcK4w3maOkIrSvgT8K+bBroDjT/s/bn6d
         W06c3JdDuAqZLZ3xrPSzHKxm9vOIIdPqX9INu6g8DhY6lBQsrAb/H8dQOwaoCr5ivLfE
         UhumGqJzdOCk6aOA6LICDxzObZwQFk1LP8HDSkqUeLFYBUnerNeAqd5HMlQ4jVjOiPHB
         CKrACqfuPgpXAe/uDPoN42KdOq4sz/5ySxs58wxiHSgnjxsOt+8acBq8SFD3CRR2m2os
         VI9vBP79hO3XNNBAdrr+KO9SW2o2Flg7YSUZPWdmeNZeNOqxeBfrP8XCyIg1eojYGImB
         8XSw==
X-Gm-Message-State: AOAM531o5F+nQjhpPNhV/Rt1jR7fhWI5KaenpPWXzgavgOgX4qI1n9St
        NWAzByupeupc9ROwtTQuQvHnMYmSuiY=
X-Google-Smtp-Source: ABdhPJxflU9//jjFkx9Uz4cNSaBWgYuoOZ5ApKbVF0tbnKConIZ2222hWojX3eMZKozHwTIBwh2XPA==
X-Received: by 2002:a05:600c:252:b0:38c:cd19:fbff with SMTP id 18-20020a05600c025200b0038ccd19fbffmr5251121wmj.65.1648743452410;
        Thu, 31 Mar 2022 09:17:32 -0700 (PDT)
Received: from DESKTOP-R5VBAL5 ([39.53.224.185])
        by smtp.gmail.com with ESMTPSA id u11-20020a056000038b00b00203e5c9aa09sm29489633wrf.27.2022.03.31.09.17.31
        for <linux-mips@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 31 Mar 2022 09:17:31 -0700 (PDT)
Message-ID: <6245d41b.1c69fb81.d2458.48b8@mx.google.com>
Date:   Thu, 31 Mar 2022 09:17:31 -0700 (PDT)
X-Google-Original-Date: 31 Mar 2022 12:17:31 -0400
MIME-Version: 1.0
From:   ulyssesdreamlandestimation@gmail.com
To:     linux-mips@vger.kernel.org
Subject: Estimating Services
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0AUlysses Kraft=0D=0ADreamland Estimation, LLC


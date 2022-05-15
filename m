Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E99F75278DF
	for <lists+linux-mips@lfdr.de>; Sun, 15 May 2022 19:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237347AbiEORPM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 May 2022 13:15:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237720AbiEORPL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 15 May 2022 13:15:11 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62EBE64D2
        for <linux-mips@vger.kernel.org>; Sun, 15 May 2022 10:15:10 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id l19so15655162ljb.7
        for <linux-mips@vger.kernel.org>; Sun, 15 May 2022 10:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=NThxsWh5Gk164xZK02dF5+RMy4grQqw0oj8nKzd9EMw=;
        b=mEsiJfJpa0YU6OBRVasClA6orHJCE3HXalK3ZpjKrRqpY0iIIbU4FztWlZ/9ey50bD
         ognfO+lJ1alR1Yyo1q5Eb6V7jWu2NCAPo6GZSwWQE+frR5KV8ynSWZLc5GjZ/ybB5jB8
         SmmH2MU0vHY2heJfi+ENi0/iKhFTeO6OVOqEGwQLpMnUAmm1IoW5NGUHTm0nA9D533hq
         8pcb/YWbqrULMT7y/yEQGyA3fKSPPI2SegvTm7WCUR6VAA1cyLeHHZ7Mhl3USoDa2mbs
         0/cf81CB15ossX4ciRHwWiBXnbg4r9JxkLXhkhSH2cZ+QgSL/M/2f4Sal9cMxCEhVcgY
         pP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=NThxsWh5Gk164xZK02dF5+RMy4grQqw0oj8nKzd9EMw=;
        b=y3sBHcrOHO6h8jiV6hV6CounEGjh9xA7+P6dW4LVAE0XxN9dkEmEVY1ewO5K9f0CqG
         br9yqAo5DKtHl+1WbvO14P9y62lw9iZWpWGQuB4ksm49dDokjFrIRh0NRXQAkAN1D+VB
         Rs1hckfkbjG8V69y2c/Nrcx8XM0RLcMrbNkX4lu9AnoDlokhWs3l6Nj9A6LbhjzlV/4R
         7kXymq7YMn1ygSdQHc2hbOxHOOE5GLYWaN5+hfYV7pCUgXyInkhDWB5/ug5kKlVqHlTj
         0UlvOdahccbBU70wZtyFu2cByEVt+UNQHTeam6+z5083lsLro1F2ARrNw1O904Uh0uOf
         5VZQ==
X-Gm-Message-State: AOAM530gtk84WmEJjfCvl6h2gPJvF/QG6/AI9k1iOdBxDLhRXEQWJPeZ
        CmbVvb3APZftKnvFoe3yqdwhrafL4p5YvOqKN74JN/ELKHU=
X-Google-Smtp-Source: ABdhPJxVY2+riiazszPFmYaiZX7MmjXr6OcflkLx07pLXhrAjDrxAzYhAgUJBMripyCa3VfpPW6aOKJHOrOejZEMIKE=
X-Received: by 2002:a2e:8696:0:b0:253:99e2:ca with SMTP id l22-20020a2e8696000000b0025399e200camr8049570lji.293.1652634908519;
 Sun, 15 May 2022 10:15:08 -0700 (PDT)
MIME-Version: 1.0
From:   Jan Prunk <janprunk@gmail.com>
Date:   Sun, 15 May 2022 19:14:32 +0200
Message-ID: <CALnoPX5iSE+uNE+fADiSkO-YrPZ+1Dxac5a=Rw012E9hj6Gr=w@mail.gmail.com>
Subject: Any Linux MIPS distribution that still supports Lemote Yeeloong?
To:     linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

I am interested, if there is a Linux distribution that still has an
active (updated) port for the Loongson2f based Lemote Yeeloong 8089B
computer? AFAIK I was only able to find the active port in Gentoo, but
haven't tried it yet.

Best regards,
Jan

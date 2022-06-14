Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 829B954B0F0
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jun 2022 14:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242822AbiFNMal (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jun 2022 08:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242912AbiFNM2b (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jun 2022 08:28:31 -0400
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46F3F2A700
        for <linux-mips@vger.kernel.org>; Tue, 14 Jun 2022 05:28:23 -0700 (PDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-fe15832ce5so12220282fac.8
        for <linux-mips@vger.kernel.org>; Tue, 14 Jun 2022 05:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=lBFrwc11MgcaK75qf3EwNhKoIfwLYz4Dn7scEjO7Hwc=;
        b=Y9nru7uKQHP8S8uMgk7AhKq0O397+YpG7ni4AgB69hB4dDtI4PddWIbXWdaCiTVQPB
         1bHn9yTVV5RA/+VUK5cxfgGjdaSgyMo0C4pSR5oeJvcLuHtnJiBaCTHZngR87ZC5HMKc
         rZcA7lo7S2q4eOxA3U2T1I18OcXwDtjjmGczVjyE8fFSK5OuK9HZzUbYZ4pWl8zmgLPL
         NF5VtlhZwmsdTnYx9h9OQWiU6ZaH4AAoEPcdnr9/1AQlDI3jQLBl59Zc1lq33HIkDB9M
         5mvOfPLeoOzgj6pr8wjNJ3N8Vha9dO8gTkaCtyEYGriE8GrxsgxWUrSv33rsa1ZshNpl
         uqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=lBFrwc11MgcaK75qf3EwNhKoIfwLYz4Dn7scEjO7Hwc=;
        b=mLVIRnWJ2DSn/oCWYpwVmvY5SLGBF7Hi2ArzcSCDUpzP/DtEmiQAusYRFELDd9bvVt
         cdRsnrAhJl4o/4+3hC1CsNOz1i19GZPzW9mmNUv66JFW5EbkYgQWAS71AeHiP172WYFh
         JLiyEZV+yp5bagQFZVazDpOeE5VOHgTpDx+X1WO5nx5/85BljfyVegri/FXnW1TG28F1
         KEjh5YGv759jbSZv8OCLJiGbs9Dn4rMxtA2d27GpCOSD0og7y7xumKf2QsvwIjof85Yv
         ldEW7SlakGLPY/Gqp1N3bR343C1UXQtvRTdLs8bBgNaOJA8ysaWUw9dOivJxGe8umgcf
         eN5w==
X-Gm-Message-State: AJIora+PDcxyVkOWp42GDWwsykNsI4Tu1ajRTkuNtnauPluIDkqQsQYZ
        NdNKYNz3YsCWmjstXsdGReLy4OlzT3qC0I1wo0M=
X-Google-Smtp-Source: AGRyM1vsEMgew+gYftu8Ww4LlASRxmMj6056rLqsY3XL/PsVz/o4YvE4qWlutapfa3VyXBxJId1inO4Rji9lyINiosA=
X-Received: by 2002:a05:6870:d287:b0:f1:c50b:9dd1 with SMTP id
 d7-20020a056870d28700b000f1c50b9dd1mr2109655oae.45.1655209702540; Tue, 14 Jun
 2022 05:28:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:c46:0:b0:42d:ab20:ed24 with HTTP; Tue, 14 Jun 2022
 05:28:22 -0700 (PDT)
From:   Daniel Affum <danielaffum05@gmail.com>
Date:   Tue, 14 Jun 2022 15:28:22 +0300
Message-ID: <CAPkju_P7cbdBPF5Z70Y93xkQOC7yPjPhbLOmm2208JgB3=QrgQ@mail.gmail.com>
Subject: Confirm Receipt
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Dear,

I am Daniel Affum a retired civil servant i have a  business to
discuss with you from the Eastern part of Africa aimed at agreed
percentage upon your acceptance of my hand in business and friendship.
Kindly respond to me if you are interested to partner with me for an
update.Very important.

Yours Sincerely,
Daniel Affum.
Reply to:danielaffum005@yahoo.com
